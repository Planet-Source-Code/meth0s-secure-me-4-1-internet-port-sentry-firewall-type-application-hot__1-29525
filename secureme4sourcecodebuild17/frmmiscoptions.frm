VERSION 5.00
Begin VB.Form frmmiscoptions 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Misc Options"
   ClientHeight    =   3945
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   5205
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3945
   ScaleWidth      =   5205
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame framerawmsg 
      Caption         =   " "
      Height          =   735
      Left            =   120
      TabIndex        =   9
      Top             =   2760
      Width           =   4935
      Begin VB.CheckBox chkrawmsg 
         Caption         =   "Send Intruder Raw Data on Connection Attempt."
         Height          =   255
         Left            =   150
         TabIndex        =   10
         TabStop         =   0   'False
         Top             =   0
         Width           =   3735
      End
      Begin VB.TextBox txtrawmsg 
         Enabled         =   0   'False
         Height          =   285
         Left            =   120
         TabIndex        =   11
         Text            =   "You do not have permission to access this service."
         Top             =   300
         Width           =   4695
      End
   End
   Begin VB.CommandButton cmdok 
      Caption         =   "Ok"
      Height          =   255
      Left            =   4080
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   3600
      Width           =   975
   End
   Begin VB.Frame Frame2 
      Caption         =   "Control Options Menu 2"
      Height          =   1095
      Left            =   120
      TabIndex        =   4
      Top             =   1560
      Width           =   4935
      Begin VB.CheckBox chkprint 
         Caption         =   "Automatically Print Warning on connection attempt."
         Height          =   255
         Left            =   120
         TabIndex        =   8
         TabStop         =   0   'False
         Top             =   720
         Width           =   4695
      End
      Begin VB.CheckBox chklisten 
         Caption         =   "Automatically Listen on Ports when Program Starts."
         Height          =   255
         Left            =   120
         TabIndex        =   7
         TabStop         =   0   'False
         Top             =   480
         Width           =   4695
      End
      Begin VB.CheckBox chksysstart 
         Caption         =   "Automatically Start when System Starts."
         Height          =   255
         Left            =   120
         TabIndex        =   6
         TabStop         =   0   'False
         Top             =   240
         Value           =   1  'Checked
         Width           =   4695
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Control Options Menu 1"
      Height          =   1335
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4935
      Begin VB.CheckBox Check1 
         Caption         =   "Ping Intruder to find out delay."
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   960
         Width           =   4695
      End
      Begin VB.CheckBox chkbeep 
         Caption         =   "Send a beep to speakers on connection attempt."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   3
         TabStop         =   0   'False
         Top             =   720
         Width           =   4695
      End
      Begin VB.CheckBox chkshowwarn 
         Caption         =   "Show me Visible Warning  on connection attempt."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   2
         TabStop         =   0   'False
         Top             =   480
         Value           =   1  'Checked
         Width           =   4695
      End
      Begin VB.CheckBox chkportscan 
         Caption         =   "Run Trojan Scan on connection attempt."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   1
         TabStop         =   0   'False
         Top             =   240
         Width           =   4215
      End
   End
End
Attribute VB_Name = "frmmiscoptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub chkrawmsg_Click()
    If chkrawmsg.Value = vbChecked Then
        txtrawmsg.Enabled = True
    ElseIf chkrawmsg.Value = vbUnchecked Then
        txtrawmsg.Enabled = False
    Else
        txtrawmsg.Enabled = False
    End If
End Sub

Private Sub cmdok_Click()
    Me.Enabled = False
    Me.Visible = False
    frmmain.Enabled = True
    frmmain.Visible = True
    Call saveprgsettings
End Sub

