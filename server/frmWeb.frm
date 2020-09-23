VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "SHDOCVW.DLL"
Begin VB.Form frmWeb 
   BorderStyle     =   0  'None
   Caption         =   "Webbrowser"
   ClientHeight    =   11115
   ClientLeft      =   0
   ClientTop       =   -225
   ClientWidth     =   15240
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   11115
   ScaleWidth      =   15240
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   195
      TabIndex        =   1
      Text            =   "0"
      Top             =   30
      Width           =   1065
   End
   Begin VB.Timer Timer2 
      Interval        =   60000
      Left            =   1200
      Top             =   3780
   End
   Begin VB.Timer Timer1 
      Left            =   1860
      Top             =   2295
   End
   Begin SHDocVwCtl.WebBrowser Web1 
      Height          =   11040
      Left            =   75
      TabIndex        =   0
      Top             =   60
      Width           =   15150
      ExtentX         =   26723
      ExtentY         =   19473
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
End
Attribute VB_Name = "frmWeb"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
' hide text feild
Text1.Visible = False
' checks if form is visible
If Me.Visible = True Then
' asks for a yes no vb box
result = MsgBox("Do you Wish to Veiw this site?", vbYesNo, "Porn Watch!")
' then ingnores watever response they ive :)
MsgBox "You have been Given 5 mins on it!", vbInformation, "Porn Watch!"
'enables other timer
Timer2.Enabled = True
End If
End Sub


Private Sub Timer2_Timer()
' checks if timer is more than 4
If Text1.Text >= 4 Then
' funny msg box
MsgBox "Times up porno freak, hope you had a pleasant orgasm- tranfering you to a new site!", vbCritical, "Porn Watcher!"
' unloads the form
Unload Me
' if timer is 4 or less then
Else
' adds 1 to text1's value
Text1.Text = Text1.Text + 1
' end the if command
End If
End Sub
