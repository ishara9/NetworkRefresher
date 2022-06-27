@echo off
	Call :check_Permissions
For /f "skip=2 tokens=2,3,*" %%a In ('NetSh Interface Show Interface') Do (
    Call :UseNetworkAdapterDisable %%a %%b "%%c"
)
cls
echo wait please...
TIMEOUT /t 5 >nul
cls
For /f "skip=2 tokens=2,3,*" %%a In ('NetSh Interface Show Interface') Do (
    Call :UseNetworkAdapterEnable %%a %%b "%%c"
)
echo You are good to go 
echo                                                    --Ishara Abeysekera(c)--
PAUSE

Exit /B

:UseNetworkAdapterDisable
:: %1 = State
:: %3 = Name (quoted); %~3 = Name (unquoted)
If %1==Connected (
	echo %3 is disconnected     
	netsh interface set interface %3 admin=DISABLE	
)
	
Exit /B

:UseNetworkAdapterEnable
:: %1 = State
:: %3 = Name (quoted); %~3 = Name (unquoted)
If %1==Disconnected (
	echo %3 is now connected     
	netsh interface set interface %3 admin=ENABLE	
)
	
Exit /B
:check_Permissions
	echo Administrative permissions require. Detecting Permissions...
	
	net session >nul 2>&1

	if %errorLevel% == 0 (
		echo Administrative rights checked : SUCCESSFUL
		

	) else ( 
		echo Administrative rights checked : FAILED
		
	
	)
Exit /B
