#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <windows.h>
#include <conio.h>
#include <psapi.h>

int main(int argc, char *argv[]) {

	char sCommand[MAX_PATH] = "";
	STARTUPINFO siStartupInfo;
	PROCESS_INFORMATION piProcessInfo;
	clock_t cProcessTimeUse;
	PROCESS_MEMORY_COUNTERS pmcProcessMemoryCounters;
	DWORD dwReturnValue;
	
	if(argc < 2) {
		MessageBox(NULL,
				   "Usage:\n\nConsolePauser.exe <filename> <parameters...>\n",
				   "Infomation",
				   MB_ICONINFORMATION);
		return -1;
	}

	for (int i = 1; i < argc; ++ i) {
		strcat(sCommand, &argv[i][0]);
		if(i != (argc - 1)) {
			strcat(sCommand, " ");
		}
	}
	SetConsoleTitle(sCommand);
	
	memset(&siStartupInfo, 0, sizeof(siStartupInfo));
	memset(&piProcessInfo, 0, sizeof(piProcessInfo));
	siStartupInfo.cb = sizeof(siStartupInfo);

	if (! CreateProcess(NULL, sCommand, NULL, NULL, FALSE, 0, NULL, NULL,
						&siStartupInfo,
						&piProcessInfo)) {
		MessageBox(NULL,
				   sCommand,
				   "Couldn't create process.\n",
				   MB_ICONERROR);
		return -1;
	}
	
	cProcessTimeUse = clock();
	WaitForSingleObject(piProcessInfo.hProcess,
						INFINITE);
	GetProcessMemoryInfo(piProcessInfo.hProcess,
						 &pmcProcessMemoryCounters,
						 sizeof(pmcProcessMemoryCounters));
	GetExitCodeProcess(piProcessInfo.hProcess,
					   &dwReturnValue);
	
	printf("\n-----------------------------------------------");
	printf("\nProcess returned: %ld (0x%X)\nExecution time: %ld ms\nMaximum memory use: %ld KB",
		   dwReturnValue,
		   dwReturnValue,
		   clock() - cProcessTimeUse,
		   (long int)(pmcProcessMemoryCounters.PeakWorkingSetSize / 8 / 1024));
	printf("\n-----------------------------------------------");
	printf("\nPress any key to continue . . . ");
	getch();

	return 0;
}

