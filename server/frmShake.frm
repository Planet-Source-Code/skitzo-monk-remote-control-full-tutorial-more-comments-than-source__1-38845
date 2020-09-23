VERSION 5.00
Begin VB.Form frmShake 
   BackColor       =   &H80000007&
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   10965
   ClientLeft      =   0
   ClientTop       =   -450
   ClientWidth     =   15090
   ForeColor       =   &H8000000E&
   LinkTopic       =   "Form2"
   ScaleHeight     =   10965
   ScaleWidth      =   15090
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   10000
      Left            =   5400
      Top             =   4845
   End
End
Attribute VB_Name = "frmshake"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
' Call all bitblt functions (just a speacialized feature not needed for a trojan
Private Declare Function GetDC Lib "user32" ( _
    ByVal hWnd As Long) As Long
    
Private Declare Function ReleaseDC Lib "user32" ( _
     ByVal hWnd As Long, _
     ByVal hDC As Long) As Long
    
Private Declare Function BitBlt Lib "gdi32" ( _
    ByVal hDestDC As Long, _
    ByVal x As Long, _
    ByVal Y As Long, _
    ByVal nWidth As Long, _
    ByVal nHeight As Long, _
    ByVal hSrcDC As Long, _
    ByVal xSrc As Long, _
    ByVal ySrc As Long, _
    ByVal dwRop As Long) As Long


Private lngDC As Long ' hDC of the screen, available to every sub/function, wich allows us to call ReleaseDC(0, lngDC) in cExit
Private blnLoop As Boolean

Private Sub Form_Load()
    Dim intX As Integer, intY As Integer
    Dim intI As Integer, intJ As Integer
    Dim intWidth As Integer, intHeight As Integer
    
    intWidth = Screen.Width / Screen.TwipsPerPixelX 'Screenwidth
    intHeight = Screen.Height / Screen.TwipsPerPixelY 'Screenheight
    
    frmshake.Width = Screen.Width  ' Set formwidth to screenwidth
    frmshake.Height = Screen.Height  ' Set formheight to screenheight
    
    lngDC = GetDC(0) ' GetDC(0) to get the hDC of the screen
    
    Call BitBlt(hDC, 0, 0, intWidth, intHeight, lngDC, 0, 0, vbSrcCopy) ' BitBlt screen onto form
    frmshake.Visible = vbTrue ' Make form visible
    frmshake.AutoRedraw = vbFalse ' Set autoredraw to 0 (or your graphics-card might cause a reboot)
    
    Randomize
    
    blnLoop = vbTrue
    Do While blnLoop = vbTrue
        intX = (intWidth - 128) * Rnd
        intY = (intHeight - 128) * Rnd
        
        intI = 2 * Rnd - 1 ' Horizontal displacement
        intJ = 2 * Rnd - 1 ' Vertical displacement
        
        ' Move a part of the screen 1 pixel in a semi-random direction, to get the "melting" effect
        Call BitBlt(frmshake.hDC, intX + intI, intY + intJ, 128, 128, frmshake.hDC, intX, intY, vbSrcCopy)
        
        DoEvents
    Loop
    
    Set frmshake = Nothing ' Remove form from memory
    Call ReleaseDC(0, lngDC) ' Release the screen-hDC
    Me.Hide
End Sub

Private Sub Timer1_Timer()
'set blnloop to false to stop shake
blnLoop = vbFalse
'disable timer
Timer1.Enabled = False
End Sub
