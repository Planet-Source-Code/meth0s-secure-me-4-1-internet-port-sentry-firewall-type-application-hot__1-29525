VERSION 5.00
Begin VB.Form frmabout 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "About Secure Me"
   ClientHeight    =   3225
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   NegotiateMenus  =   0   'False
   ScaleHeight     =   3225
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      ForeColor       =   &H00000000&
      Height          =   1935
      Left            =   240
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   4
      Text            =   "frmabout.frx":0000
      Top             =   720
      Width           =   4215
   End
   Begin VB.CommandButton cmdclose 
      Caption         =   "Close"
      Height          =   255
      Left            =   3720
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   2880
      Width           =   855
   End
   Begin VB.CommandButton cmdreg 
      Caption         =   "Register"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   2880
      Width           =   1575
   End
   Begin VB.Line Line2 
      X1              =   240
      X2              =   4440
      Y1              =   2760
      Y2              =   2760
   End
   Begin VB.Line Line1 
      X1              =   240
      X2              =   4440
      Y1              =   600
      Y2              =   600
   End
   Begin VB.Label lblcaption 
      BackStyle       =   0  'Transparent
      Caption         =   "Secure Me + 4.1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   735
      Index           =   0
      Left            =   120
      TabIndex        =   1
      Top             =   0
      Width           =   3735
   End
   Begin VB.Label lblcaption 
      BackStyle       =   0  'Transparent
      Caption         =   "Secure Me + 4.1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00808080&
      Height          =   735
      Index           =   1
      Left            =   195
      TabIndex        =   2
      Top             =   75
      Width           =   3735
   End
End
Attribute VB_Name = "frmabout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdclose_Click()
frmmain.Enabled = True
frmmain.SetFocus
End Sub

Private Sub cmdreg_Click()
frmregstr.Show
frmregstr.SetFocus
frmmain.Enabled = True
Me.Hide
End Sub

Private Sub Form_Terminate()
frmmain.Enabled = True
frmmain.SetFocus
End Sub

Private Sub Form_Unload(Cancel As Integer)
frmmain.Enabled = True
frmmain.SetFocus
End Sub
