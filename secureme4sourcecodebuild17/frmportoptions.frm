VERSION 5.00
Begin VB.Form frmportoptions 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Port Options"
   ClientHeight    =   2610
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   3615
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2610
   ScaleWidth      =   3615
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "ok"
      Height          =   255
      Left            =   2640
      TabIndex        =   9
      Top             =   2280
      Width           =   855
   End
   Begin VB.Frame Frame2 
      Caption         =   " "
      Height          =   1095
      Left            =   120
      TabIndex        =   3
      Top             =   1080
      Width           =   3375
      Begin VB.TextBox txttelnetseconds 
         Alignment       =   2  'Center
         Height          =   285
         Left            =   1360
         TabIndex        =   8
         Text            =   "20"
         Top             =   680
         Width           =   450
      End
      Begin VB.TextBox txttype 
         Height          =   285
         Left            =   1100
         TabIndex        =   6
         Text            =   "[root@localhost /]"
         Top             =   320
         Width           =   1935
      End
      Begin VB.CheckBox chktelnet 
         Caption         =   "Fake linux telnet server:"
         Height          =   255
         Left            =   150
         TabIndex        =   4
         Top             =   0
         Value           =   1  'Checked
         Width           =   1980
      End
      Begin VB.Label Label2 
         Caption         =   "Disconnect after             Seconds"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   720
         Width           =   3015
      End
      Begin VB.Label Label1 
         Caption         =   "Server Send:"
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Disconnect Options:"
      Height          =   855
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3375
      Begin VB.TextBox txtall 
         Alignment       =   2  'Center
         Height          =   285
         Left            =   2190
         TabIndex        =   10
         Text            =   "5"
         Top             =   460
         Width           =   375
      End
      Begin VB.OptionButton optseconds 
         Caption         =   "Disconnect all ports after          seconds."
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   500
         Value           =   -1  'True
         Width           =   3230
      End
      Begin VB.OptionButton optall 
         Caption         =   "Disconnect all ports after 0 seconds"
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   2895
      End
   End
End
Attribute VB_Name = "frmportoptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub chktelnet_Click()
    If chktelnet.Value = vbChecked Then
        txttype.Enabled = True
        txttelnetseconds.Enabled = True
    Else
        txttype.Enabled = False
        txttelnetseconds.Enabled = False
    End If
End Sub

Private Sub Command1_Click()
    Me.Enabled = False
    Me.Visible = False
    frmmain.Enabled = True
    frmmain.Visible = True
    Call saveprgsettings
End Sub

Private Sub optseconds_Click()
    If optseconds.Value = True Then
        txtall.Enabled = True
    Else
        txtall.Enabled = False
    End If
End Sub
