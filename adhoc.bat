@echo off
Call :check_Permissions
netsh wlan set hostednetwork mode=allow ssid=adhoc_arimac key=password
netsh wlan start hostednetwork
echo wait please...
TIMEOUT /t 5 >nul
netsh wlan start hostednetwork
echo                                                    --Ishara Abeysekera(c)--
PAUSE
pause


:check_Permissions
	echo Administrative permissions require. Detecting Permissions...
	
	net session >nul 2>&1

	if %errorLevel% == 0 (
		echo Administrative rights checked : SUCCESSFUL
		

	) else ( 
		echo Administrative rights checked : FAILED
		
	
	)
Exit /B