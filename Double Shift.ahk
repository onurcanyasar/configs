#Requires AutoHotkey v2.0

global shiftCount := 0  ; Declare shiftCount as a global variable
maxDelay := 400         ; Max time (in milliseconds) between the two Shift presses

~Shift::
{
    if WinActive("ahk_class Notepad")  ; Check if the active window is Notepad
    {
        global shiftCount  ; Access the global shiftCount variable
        if (shiftCount == 0) {
            shiftCount := 1
            SetTimer CheckShiftPress, maxDelay  ; No % signs needed for v2
        } else if (shiftCount == 1) {
            Send "!{Tab}"  ; Simulate Alt+Tab
            shiftCount := 0
        }
    }
    return
}

CheckShiftPress()
{
    global shiftCount  ; Access the global shiftCount variable
    shiftCount := 0
}
