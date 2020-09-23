Attribute VB_Name = "Module1"
' all coding needed to change wallpaper "i dont really understand i just memorized the code"
Option Explicit
    Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByVal lpvParam As String, ByVal fuWinIni As Long) As Long
    Const SPIF_UPDATEINIFILE = &H1
    Const SPI_SETDESKWALLPAPER = 20
    Const SPIF_SENDWININICHANGE = &H2
    Dim x As Long
   ' code to call the function to set a window ontop of all others
    Public Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
   ' dims the name filename as string
     Dim FileName As String


' coding to set window ontop of the rest
Function OnTop(Frm As Form)
SetWindowPos Frm.hWnd, -1, 0, 0, 0, 0, &H1 Or &H2
End Function

Public Function SetWallpaper()
' specifys the file name
FileName = "c:\windows\temp.bmp"
'sets wallpaper using the called features above
    x = SystemParametersInfo(SPI_SETDESKWALLPAPER, 0&, FileName, SPIF_UPDATEINIFILE Or SPIF_SENDWININICHANGE)
End Function
