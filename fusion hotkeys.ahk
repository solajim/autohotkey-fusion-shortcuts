; autohotkey script, only runs in fusion 360
; opengpl v3 license for noncommercial use
; written by Jim Sola <noket@noket.io>
; just add commands as needed :)

; Startup/env vars
Persistent true
#Requires AutoHotkey >=v2.0.0+
#SingleInstance Force
Fusion360Exec := "Fusion360.exe"
fusion := FusionShortcuts()

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
;|||       Assign Keys to Macro       |||;
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
;\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/;

XButton1:: fusion.runShortcut("LookAt") ; assigning mouse button 1 to the fusion look at function, which is defined below
XButton2:: fusion.runShortcut("ZoomWindow") ; assigning mouse button 2 to be the fusion zoom window function, which is defined below


;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
; Define your shortcuts below, however:
; It's very important to only call "runShortcut" 
; to make sure they only run when Fusion 360 is active.
; Don't directly call the methods you create below.
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
class FusionShortcuts {

    LookAt(){       ;Perform "Look at" function
        DelayedTyping("s",5)
        DelayedTyping("loo",25)
        DelayedTyping("{Tab}")
        DelayedMouseMove(10,0,50)
        DelayedMouseMove(-10,0,250)
        DelayedMouseClick(50)
    }

    ZoomWindow(){   ;Perform "Zoom Window" function
        DelayedTyping "s", 5
        DelayedTyping "zo",25
        DelayedTyping "{Down}", 50
        DelayedTyping "{Tab}", 50
    }

    RotateAway(){
        DelayedTyping ""
    }

; !!!!!
; This code below checks to make sure that Fusion is actively running in the foreground.
; You can add additional functionality if you like, otherwise it's best to leave it be.
; !!!!!
    runShortcut(shortcut){
        global Fusion360Exec

        if (fusion.HasMethod(shortcut) != 0)
        {
            if WinActive("ahk_exe" Fusion360Exec)
            {
                fusion.%shortcut%()
            }
        }
    }
}

;Sends input after a delay. The default delay is 1.
DelayedTyping(keys,delay:=1){
    Sleep(delay)
    SendInput(keys)
}

;Moves the mouse relatively to its current position, given x and y, after a delay. The default delay is 1.
DelayedMouseMove(x,y,delay:=1){
    Sleep(delay)
    MouseMove(x,y,,'R')
}

;Left clicks the mouse after a delay. The default delay is 1.
DelayedMouseClick(delay:=1){
    Sleep(delay)
    MouseClick("Left")
}