VERSION 5.00
Begin VB.Form frmbytesreceived 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Bytes Received:"
   ClientHeight    =   3450
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6015
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   NegotiateMenus  =   0   'False
   ScaleHeight     =   3450
   ScaleWidth      =   6015
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdclose 
      Caption         =   "Close"
      Height          =   255
      Left            =   4800
      TabIndex        =   2
      Top             =   3120
      Width           =   1095
   End
   Begin VB.CommandButton cmdprint 
      Caption         =   "Print"
      Height          =   255
      Left            =   3600
      TabIndex        =   1
      Top             =   3120
      Width           =   1095
   End
   Begin VB.TextBox txtbytes 
      Height          =   2895
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   120
      Width           =   5775
   End
End
Attribute VB_Name = "frmbytesreceived"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdclose_Click()
   Me.Hide
   frmmain.SetFocus
End Sub
