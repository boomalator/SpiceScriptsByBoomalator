net stop w32time
w32tm /unregister
rem Disable Hyper-V Time Sync
reg add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\VMICTimeProvider /v Enabled /t reg_dword /d 0 
w32tm /register
net start w32time
tzutil /s "Mountain Standard Time"
w32tm /config /syncfromflags:domhier /update
w32tm /resync 
net stop w32time
net start w32time
