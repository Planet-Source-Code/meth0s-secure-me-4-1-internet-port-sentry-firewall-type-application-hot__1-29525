VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmportscan 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Port Scanner 1.1"
   ClientHeight    =   4425
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3045
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4425
   ScaleWidth      =   3045
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command4 
      Caption         =   "Ports"
      Height          =   255
      Left            =   0
      TabIndex        =   12
      Top             =   3840
      Width           =   615
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Save Scan"
      Height          =   255
      Left            =   1080
      TabIndex        =   11
      Top             =   3840
      Width           =   975
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Close"
      Height          =   255
      Left            =   2160
      TabIndex        =   10
      Top             =   3840
      Width           =   855
   End
   Begin VB.TextBox txtstop 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   2400
      TabIndex        =   7
      Text            =   "1000"
      Top             =   1200
      Width           =   495
   End
   Begin VB.TextBox txtstart 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   2400
      TabIndex        =   6
      Text            =   "1"
      Top             =   840
      Width           =   495
   End
   Begin VB.TextBox txtsockets 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   2400
      TabIndex        =   5
      Text            =   "20"
      Top             =   480
      Width           =   495
   End
   Begin VB.TextBox txtip 
      Enabled         =   0   'False
      Height          =   285
      Left            =   960
      TabIndex        =   3
      Text            =   "127.0.0.1"
      Top             =   0
      Width           =   2055
   End
   Begin VB.ListBox List1 
      Height          =   2205
      Left            =   0
      TabIndex        =   2
      Top             =   1560
      Width           =   3015
   End
   Begin MSWinsockLib.Winsock sock 
      Index           =   0
      Left            =   1920
      Top             =   2400
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Start Scan"
      Height          =   285
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   975
   End
   Begin MSComctlLib.StatusBar Status 
      Align           =   2  'Align Bottom
      Height          =   255
      Left            =   0
      TabIndex        =   1
      Top             =   4170
      Width           =   3045
      _ExtentX        =   5371
      _ExtentY        =   450
      Style           =   1
      SimpleText      =   "Idle..."
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Stop Port:"
      Height          =   255
      Left            =   120
      TabIndex        =   9
      Top             =   1200
      Width           =   735
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Start Port:"
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   840
      Width           =   975
   End
   Begin VB.Label lblmax 
      BackStyle       =   0  'Transparent
      Caption         =   "Max Sockets:"
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   480
      Width           =   975
   End
End
Attribute VB_Name = "frmportscan"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
Dim Socket As Variant
Dim CurrentPort As Integer

MaxSockets = txtsockets.Text

On Error Resume Next

If Command1.Caption = "Start Scan" Then

txtsockets.Enabled = False
txtstart.Enabled = False
txtstop.Enabled = False

Command1.Caption = "Stop Scan"
    For i = 1 To MaxSockets
        Load sock(i)
    Next i
    CurrentPort = txtstart.Text
    While Command1.Caption = "Stop Scan"
        For Each Socket In sock
            DoEvents
            If Socket.State <> sckClosed Then
                GoTo continue
            End If
            Socket.Close
            If CurrentPort = Val(txtstop.Text) + 1 _
            Then Exit For
            Socket.RemoteHost = txtip.Text
            Socket.remoteport = CurrentPort
            Status.SimpleText = "Now Scanning Port " & CurrentPort
            Socket.Connect
            CurrentPort = CurrentPort + 1
continue:
    
        Next Socket
    Wend
Command1.Caption = "Start Scan"


txtsockets.Enabled = True
txtstart.Enabled = True
txtstop.Enabled = True

Else
    Command1.Caption = "Start Scan"
End If

For i = 1 To MaxSockets
    Unload sock(i)
Next i

End Sub

Private Function AddPort(Port As Integer)
List1.AddItem "[Connected] Port " & Port
End Function

Private Sub Command2_Click()
frmmain.SetFocus
Me.Hide
txtip.Text = "127.0.0.1"
End Sub

Private Sub Sock_Connect(Index As Integer)
AddPort (sock(Index).remoteport)
sock(Index).Close
End Sub

Private Sub Sock_Error(Index As Integer, ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
sock(Index).Close
End Sub


