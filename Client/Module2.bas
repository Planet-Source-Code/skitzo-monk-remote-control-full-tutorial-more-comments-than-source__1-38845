Attribute VB_Name = "Module1"

Sub wait(howlong)
' USAGE: wait #ofseconds; example wait 3 will wait 3 seconds
' make the temptime a timer
temptime = Timer
' start the loop
Do
' tell to do events
DoEvents
' tell it to loop while the timer is less than temptime + number of seconds
Loop While Timer < temptime + howlong
End Sub

