unit CnWaterEffect;

interface

//{$I CnPack.inc}

uses
    Windows, SysUtils, Graphics, Math, Dialogs;

type
    PIntArray = ^TIntArray;
    TIntArray = array[0..65535] of Integer;

    PPIntArray = ^TPIntArray;
    TPIntArray = array[0..65535] of PIntArray;

    PRGBArray = ^TRGBArray;
    TRGBArray = array[0..65535] of TRGBTriple;

    PPRGBArray = ^TPRGBArray;
    TPRGBArray = array[0..65535] of PRGBArray;

    TWaterDamping = 1..99;

    TCnWaterEffect = class
    private
        FLightModifier: Integer;
        FWidth: Integer;
        FHeight: Integer;
        FBuff1: Pointer;
        FBuff2: Pointer;
        FScanLine1: PPIntArray;
        FScanLine2: PPIntArray;
        FScanLineSrc: PPRGBArray;
        FDamping: TWaterDamping;

        procedure SetDamping(Value: TWaterDamping);
    protected
        procedure CalcWater;
        procedure DrawWater(Src, Dst: TBitmap);
    public
        constructor Create;
        destructor Destroy; override;

        procedure ClearWater;
        procedure SetSize(AWidth, AHeight: Integer);
        procedure Render(Src, Dst: TBitmap);
        procedure Blob(x, y: Integer; ARadius, ANumber: Integer);

    published
        property Damping: TWaterDamping read FDamping write SetDamping;
    end;

implementation

{ TCnWaterEffect }

const
    RAND_MAX = $7FFF;

procedure TCnWaterEffect.Blob(x, y: Integer; ARadius, ANumber: Integer);
var
    cx, cy: Integer;
    Left, Top, Right, Bottom: Integer;
begin
    if (x < 0) or (x > FWidth - 1) then
        x := 1 + ARadius + Random(RAND_MAX) mod (FWidth - 2 * ARadius - 1);
    if (y < 0) or (y > FHeight - 1) then
        y := 1 + ARadius + Random(RAND_MAX) mod (FHeight - 2 * ARadius - 1);

    Left := -Min(x, ARadius);
    Right := Min(FWidth - 1 - x, ARadius);
    Top := -Min(y, ARadius);
    Bottom := Min(FHeight - 1 - y, ARadius);

    for cy := Top to Bottom do
    begin
        for cx := Left to Right do
            if (Sqr(cx) + Sqr(cy) <= Sqr(ARadius)) then
                Inc(FScanLine1[cy + y][cx + x], ANumber);
    end;
end;

procedure TCnWaterEffect.CalcWater;
var
    x, y, xl, xr: Integer;
    NewH: Integer;
    P, P1, P2, P3: PIntArray;
    PT: Pointer;
    Rate: Integer;
begin
    Rate := (100 - FDamping) * 256 div 100; //204  FDamping = 20

    for y := 0 to FHeight - 1 do
    begin
        P := FScanLine2[y];
        P1 := FScanLine1[Max(y - 1, 0)];
        P2 := FScanLine1[y];
        P3 := FScanLine1[Min(y + 1, FHeight - 1)];
        for x := 0 to FWidth - 1 do
        begin
            xl := Max(x - 1, 0);
            xr := Min(x + 1, FWidth - 1);
            NewH := (P1[xl] + P1[x] + P1[xr] + P2[xl] + P2[xr] + P3[xl] + P3[x] +
                P3[xr]) div 4 - P[x];
            P[x] := NewH * Rate div 256;
        end;
    end;

    PT := FBuff1;
    FBuff1 := FBuff2;
    FBuff2 := PT;
    PT := FScanLine1;
    FScanLine1 := FScanLine2;
    FScanLine2 := PT;
end;

procedure TCnWaterEffect.ClearWater;
begin
    if FBuff1 <> nil then
        ZeroMemory(FBuff1, (FWidth * FHeight) * SizeOf(Integer));
    if FBuff2 <> nil then
        ZeroMemory(FBuff2, (FWidth * FHeight) * SizeOf(Integer));
end;

constructor TCnWaterEffect.Create;
begin
    inherited;
    FLightModifier := 10;
    //FDamping := 20;
end;

destructor TCnWaterEffect.Destroy;
begin
    if FBuff1 <> nil then
        FreeMem(FBuff1);
    if FBuff2 <> nil then
        FreeMem(FBuff2);
    if FScanLine1 <> nil then
        FreeMem(FScanLine1);
    if FScanLine2 <> nil then
        FreeMem(FScanLine2);
    if FScanLineSrc <> nil then
        FreeMem(FScanLineSrc);
    inherited;
end;

procedure TCnWaterEffect.DrawWater(Src, Dst:
    TBitmap);
var
    dx, dy: Integer;
    i, c, x, y: Integer;
    P1, P2, P3: PIntArray;
    PSrc, PDst: PRGBArray;
    PSrcDot, PDstDot: PRGBTriple;
    BytesPerLine1, BytesPerLine2: Integer;
begin
    Src.PixelFormat := pf24bit;
    Dst.PixelFormat := pf24bit;

    FScanLineSrc[0] := Src.ScanLine[0];
    BytesPerLine1 := Integer(Src.ScanLine[1]) - Integer(FScanLineSrc[0]);
    for i := 1 to FHeight - 1 do
        FScanLineSrc[i] := PRGBArray(Integer(FScanLineSrc[i - 1]) + BytesPerLine1);

    PDst := Dst.ScanLine[0];
    BytesPerLine2 := Integer(Dst.ScanLine[1]) - Integer(PDst);

    for y := 0 to FHeight - 1 do
    begin
        PSrc := FScanLineSrc[y];
        P1 := FScanLine1[Max(y - 1, 0)];
        P2 := FScanLine1[y];
        P3 := FScanLine1[Min(y + 1, FHeight - 1)];
        for x := 0 to FWidth - 1 do
        begin
            dx := P2[Max(x - 1, 0)] - P2[Min(x + 1, FWidth - 1)];
            dy := P1[x] - P3[x];

            if (x + dx >= 0) and (x + dx < FWidth) and (y + dy >= 0) and
                (y + dy < FHeight) then
            begin
                PSrcDot := @FScanLineSrc[y + dy][x + dx];
                PDstDot := @PDst[x];

                c := PSrcDot.rgbtBlue - dx;
                if c < 0 then
                    PDstDot.rgbtBlue := 0
                else if c > 255 then
                    PDstDot.rgbtBlue := 255
                else
                    PDstDot.rgbtBlue := c;

                c := PSrcDot.rgbtGreen - dx;
                if c < 0 then
                    PDstDot.rgbtGreen := 0
                else if c > 255 then
                    PDstDot.rgbtGreen := 255
                else
                    PDstDot.rgbtGreen := c;

                c := PSrcDot.rgbtRed - dx;
                if c < 0 then
                    PDstDot.rgbtRed := 0
                else if c > 255 then
                    PDstDot.rgbtRed := 255
                else
                    PDstDot.rgbtRed := c;
            end
            else
            begin
                PDst[x] := PSrc[x];
            end;
        end;
        PDst := PRGBArray(Integer(PDst) + BytesPerLine2);
    end;
end;

procedure TCnWaterEffect.Render(Src, Dst: TBitmap);
begin
    CalcWater;
    DrawWater(Src, Dst);
end;

procedure TCnWaterEffect.SetDamping(Value: TWaterDamping);
begin
    if (Value >= Low(TWaterDamping)) and (Value <= High(TWaterDamping)) then
        FDamping := Value;
end;

procedure TCnWaterEffect.SetSize(AWidth, AHeight: Integer);
var
    i: Integer;
begin
    if (AWidth <= 0) or (AHeight <= 0) then
    begin
        AWidth := 0;
        AHeight := 0;
    end;

    FWidth := AWidth;
    FHeight := AHeight;
    ReallocMem(FBuff1, FWidth * FHeight * SizeOf(Integer));
    ReallocMem(FBuff2, FWidth * FHeight * SizeOf(Integer));
    ReallocMem(FScanLine1, FHeight * SizeOf(PIntArray));
    ReallocMem(FScanLine2, FHeight * SizeOf(PIntArray));
    ReallocMem(FScanLineSrc, FHeight * SizeOf(PRGBArray));
    ClearWater;

    if FHeight > 0 then
    begin
        FScanLine1[0] := FBuff1;
        FScanLine2[0] := FBuff2;
        for i := 1 to FHeight - 1 do
        begin
            FScanLine1[i] := @FScanLine1[i - 1][FWidth];
            FScanLine2[i] := @FScanLine2[i - 1][FWidth];
        end;
    end;
end;

end.
