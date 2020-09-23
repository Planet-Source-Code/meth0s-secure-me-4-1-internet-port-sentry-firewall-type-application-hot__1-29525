VERSION 5.00
Begin VB.Form frmopenports 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Port Information"
   ClientHeight    =   2445
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5415
   Icon            =   "frmopenports.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2445
   ScaleWidth      =   5415
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command1 
      Caption         =   "Ok"
      Height          =   255
      Left            =   4080
      TabIndex        =   1
      Top             =   2080
      Width           =   1215
   End
   Begin VB.ListBox List1 
      Height          =   2205
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2415
   End
   Begin VB.ListBox List2 
      Height          =   1035
      Left            =   1560
      TabIndex        =   3
      Top             =   120
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      Caption         =   "Select a Port from the list to the left."
      Height          =   1935
      Left            =   2640
      TabIndex        =   2
      Top             =   120
      Width           =   2775
   End
End
Attribute VB_Name = "frmopenports"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Me.Enabled = False
    Me.Visible = False
    frmmain.Enabled = True
    frmmain.Visible = True
End Sub

Private Sub Form_Terminate()
    Me.Enabled = False
    Me.Visible = False
    frmmain.Enabled = True
    frmmain.Visible = True
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Me.Enabled = False
    Me.Visible = False
    frmmain.Enabled = True
    frmmain.Visible = True
End Sub

Private Sub List1_Click()
On Error Resume Next
    If List1.ListIndex = -1 Then Exit Sub
    List2.Selected(List1.ListIndex) = True
    If frmmain.serv(List2.Text).State = sckListening Then
        Label1.Caption = "Port " & List1.Text & " is open" & vbCrLf & vbCrLf & _
        "Everything seems to be running fine." & vbCrLf & vbCrLf & _
        "If this port is not working its because your system has run out of socket space." & vbCrLf & vbCrLf & "Tip: Upgrade to Windows NT"
    Else
        Label1.Caption = "Port " & List1.Text & " is closed" & vbCrLf & vbCrLf & _
        "This port may be closed because another application is already" & vbCrLf & "using this port."
    End If
End Sub
