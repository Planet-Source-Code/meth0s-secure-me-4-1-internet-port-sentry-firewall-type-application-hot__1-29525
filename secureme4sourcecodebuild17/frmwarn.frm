VERSION 5.00
Begin VB.Form frmwarn 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Warning - "
   ClientHeight    =   2565
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4455
   ControlBox      =   0   'False
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2565
   ScaleWidth      =   4455
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame Frame1 
      Height          =   2655
      Left            =   0
      TabIndex        =   0
      Top             =   -90
      Width           =   4455
      Begin VB.CommandButton Command1 
         Caption         =   "Print"
         Height          =   255
         Left            =   2520
         TabIndex        =   11
         TabStop         =   0   'False
         Top             =   2280
         Width           =   855
      End
      Begin VB.CommandButton cmdclose 
         Caption         =   "Close"
         Height          =   255
         Left            =   3480
         TabIndex        =   1
         TabStop         =   0   'False
         Top             =   2280
         Width           =   855
      End
      Begin VB.CommandButton cmdhelp 
         Caption         =   "?"
         Height          =   285
         Left            =   4080
         TabIndex        =   9
         TabStop         =   0   'False
         Top             =   240
         Width           =   255
      End
      Begin VB.Label lbllocaltime 
         Caption         =   "Local Time:"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   2040
         Width           =   4215
      End
      Begin VB.Line Line1 
         X1              =   120
         X2              =   4320
         Y1              =   1250
         Y2              =   1250
      End
      Begin VB.Label lbllocaladdress 
         Caption         =   "Local Address: "
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   1560
         Width           =   4215
      End
      Begin VB.Label lbllocalhostname 
         Caption         =   "Local HostName: "
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   1320
         Width           =   4215
      End
      Begin VB.Label lblremoteport 
         Caption         =   "Remote Port: "
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   720
         Width           =   4215
      End
      Begin VB.Label lbllocalport 
         Caption         =   "Local Port: "
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   1800
         Width           =   4215
      End
      Begin VB.Label lblpingreply 
         Caption         =   "Ping Reply: "
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   960
         Width           =   4215
      End
      Begin VB.Label lblhostname 
         Caption         =   "Remote HostName: "
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   4215
      End
      Begin VB.Label lbladdress 
         Caption         =   "Remote Address: "
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   480
         Width           =   4215
      End
   End
End
Attribute VB_Name = "frmwarn"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdclose_Click()
On Error GoTo er
   Unload Me
   frmwarn.SetFocus
er:
   frmmain.SetFocus
End Sub
