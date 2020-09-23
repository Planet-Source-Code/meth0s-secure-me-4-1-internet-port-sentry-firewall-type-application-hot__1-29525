VERSION 5.00
Begin VB.Form frmpls 
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   3225
   ClientLeft      =   15
   ClientTop       =   15
   ClientWidth     =   4305
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmpls.frx":0000
   ScaleHeight     =   3225
   ScaleWidth      =   4305
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "Register"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   2880
      Width           =   1095
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   1920
      Top             =   1440
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   $"frmpls.frx":6414
      ForeColor       =   &H00FFFFFF&
      Height          =   1455
      Left            =   240
      TabIndex        =   1
      Top             =   720
      Width           =   3855
   End
   Begin VB.Label lbltime 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "20 Seconds Remaining"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   1560
      TabIndex        =   0
      Top             =   2890
      Width           =   2535
   End
End
Attribute VB_Name = "frmpls"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim seconds As Integer

Private Sub Command1_Click()
frmregstr.Show
StayOnTop frmregstr
End Sub

Private Sub Form_Initialize()
StayOnTop Me
End Sub

Private Sub Form_Load()
StayOnTop Me
seconds = 20
End Sub

Private Sub Form_Terminate()
frmmain.Enabled = True
frmmain.Show
End Sub

Private Sub Form_Unload(Cancel As Integer)
frmmain.Enabled = True
frmmain.Show
End Sub

Private Sub Timer1_Timer()
If seconds = 0 Then
NotOntop Me
Unload Me
MsgBox "Please register your version of Secure Me + 4.1", vbInformation, "Secure Me"
frmmain.Enabled = True
frmmain.Show
Else
seconds = seconds - 1
lbltime.Caption = seconds & " Seconds Remaining"
End If
End Sub
