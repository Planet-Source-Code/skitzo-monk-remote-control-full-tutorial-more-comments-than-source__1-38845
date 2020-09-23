VERSION 5.00
Begin VB.Form frmpic 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   5370
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3150
   LinkTopic       =   "Form2"
   Picture         =   "Form2.frx":0000
   ScaleHeight     =   5370
   ScaleWidth      =   3150
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   6000
      Left            =   615
      Top             =   1755
   End
   Begin VB.Label Label1 
      Caption         =   "Funnier if is chaged to porn !!!"
      Height          =   240
      Left            =   315
      TabIndex        =   0
      Top             =   5490
      Width           =   2910
   End
End
Attribute VB_Name = "frmpic"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
' makes a msgbox to ridicule them
' put form ontop of all others
Call OnTop(frmpic)
MsgBox "Pervert!", vbCritical, "PERVERT ALERT!"
'starts the countdown timer (note in properties the timer interval is set to 6000 milliseconds or 6 seconds taht is how u set lengths of times
Timer1.Enabled = True
End Sub

Private Sub Timer1_Timer()
'timer controls stop timer ticking and unload the form
Timer1.Enabled = False
Unload Me
End Sub

