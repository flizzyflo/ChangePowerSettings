
#capture the active scheme GUID
$activeScheme = cmd /c "powercfg /getactivescheme"
$regEx = '(\{){0,1}[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}(\}){0,1}'
$asGuid = [regex]::Match($activeScheme,$regEx).Value

#relative GUIDs for Lid Close settings
$pwrGuid = '4f971e89-eebd-4455-a8de-9e59040e7347'
$lidClosedGuid = '5ca83367-6e45-459f-a27b-476b1d01c936'

# DC Value // On Battery // 1 = sleep
cmd /c "powercfg /setdcvalueindex $asGuid $pwrGuid $lidClosedGuid 1"
#AC Value // While plugged in // 0 = do nothing
cmd /c "powercfg /setacvalueindex $asGuid $pwrGuid $lidClosedGuid 0"

#apply settings
cmd /c "powercfg /s $asGuid"