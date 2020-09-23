VERSION 5.00
Object = "{C4A002DB-CD56-11D5-831D-444553540000}#1.0#0"; "trocx.ocx"
Begin VB.Form frmregstr 
   BorderStyle     =   0  'None
   Caption         =   "Registration"
   ClientHeight    =   1575
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4695
   LinkTopic       =   "Form3"
   ScaleHeight     =   1575
   ScaleWidth      =   4695
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin trocx1.UserControl1 mytrial 
      Left            =   240
      Top             =   960
      _ExtentX        =   1085
      _ExtentY        =   873
      securitykey     =   "4896"
   End
   Begin VB.CommandButton Command3 
      Caption         =   "End"
      Height          =   255
      Left            =   3960
      TabIndex        =   7
      Top             =   1200
      Width           =   615
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Register"
      Height          =   255
      Left            =   2640
      TabIndex        =   6
      Top             =   1200
      Width           =   1215
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   840
      TabIndex        =   4
      Top             =   840
      Width           =   3735
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   840
      TabIndex        =   2
      Top             =   480
      Width           =   3735
   End
   Begin VB.CommandButton Command1 
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4320
      TabIndex        =   0
      Top             =   70
      Width           =   255
   End
   Begin VB.Image Image1 
      Height          =   375
      Left            =   0
      Top             =   0
      Width           =   4695
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      Caption         =   "Serial:"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   870
      Width           =   615
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   "Name:"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   500
      Width           =   615
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Registration. - Secure Me + 4.1"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   100
      Width           =   4095
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00404040&
      BorderWidth     =   2
      X1              =   0
      X2              =   4680
      Y1              =   360
      Y2              =   360
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00404040&
      Height          =   1545
      Left            =   0
      Top             =   15
      Width           =   4665
   End
   Begin VB.Shape Shape1 
      Height          =   1575
      Left            =   0
      Top             =   0
      Width           =   4695
   End
End
Attribute VB_Name = "frmregstr"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'take note. in the control. there is somthing called.
'securitykey which is how its encrypted.
'make sure you know what number you have.
'feel free to change it.

Private Sub Command1_Click()
Me.Hide
frmmain.Show
End Sub

Private Sub Command2_Click()
On Error Resume Next 'if there is a error. keep going.
mytrial.username = Text1.Text 'saying what there user name is.
mytrial.userserial = Text2.Text 'saying what they think the serial is.
mytrial.checknameandserial 'lets check to see if its right or wrong.
End Sub

Private Sub Command3_Click()
Me.Hide
frmmain.Show
End Sub

Private Sub Form_Load()
StayOnTop Me
End Sub

Private Sub Form_Terminate()
Me.Hide
frmmain.Show
End Sub

Private Sub Form_Unload(Cancel As Integer)
Me.Hide
frmmain.Show
End Sub

Private Sub Image1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 1 Then
DragObject Me
End If
'so we can drag the form around as if it had a border
End Sub

Private Sub mytrial_rightserial()
On Error Resume Next 'if there is a error keep going.

whatsalllength = Text1.Text + Text2.Text + Chr(84) & Chr(114) & Chr(117) & Chr(101)
        'Save the text file.  This writes over the the information from the last save.
        Open Chr(105) & Chr(115) & Chr(114) & Chr(101) & Chr(103) & Chr(46) & Chr(107) & Chr(101) & Chr(121) For Output As #1
        Print #1, Text1.Text
        Print #1, Text2.Text
        Print #1, Chr(84) & Chr(114) & Chr(117) & Chr(101)
        Print #1, Len(whatsalllength) * 7
        Print #1, Chr(65) & Chr(108) & Chr(108) & Chr(32) & Chr(121) & Chr(117) & Chr(114) & Chr(32) & Chr(98) & Chr(97) & Chr(115) & Chr(101) & Chr(32) & Chr(97) & Chr(114) & Chr(101) & Chr(32) & Chr(98) & Chr(101) & Chr(108) & Chr(111) & Chr(110) & Chr(103) & Chr(32) & Chr(116) & Chr(111) & Chr(32) & Chr(117) & Chr(115) & Chr(33)
        Print #1, Chr(67) & Chr(111) & Chr(100) & Chr(101) & Chr(100) & Chr(32) & Chr(98) & Chr(121) & Chr(32) & Chr(109) & Chr(101) & Chr(116) & Chr(104) & Chr(48) & Chr(115) & Chr(32) & Chr(119) & Chr(119) & Chr(119) & Chr(46) & Chr(109) & Chr(101) & Chr(116) & Chr(104) & Chr(48) & Chr(115) & Chr(46) & Chr(99) & Chr(111) & Chr(109) & Chr(32) & Chr(73) & Chr(67) & Chr(81) & Chr(35) & Chr(52) & Chr(49) & Chr(53) & Chr(57) & Chr(52) & Chr(52) & Chr(48)
        Close #1 'Close the file
Me.Hide
frmpls.Hide
frmmain.Show
frmpls.Timer1.Enabled = False
frmmain.Enabled = True
MsgBox "Thank you for registering your copy of Secure Me +", vbExclamation, "Secure Me"

'telling them they have gotten it right.

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'writing to a text file for future refrence if registerd or not'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

'this has some GOOD Security on it..
'if you edit the registration file ONE BIT.
'it will know. by some stuff I added to the button.
'this can all be changed. but I did mine.
'so that the length of Text1.Text + Text2.Text + Chr(84) & Chr(114) & Chr(117) & Chr(101)
'times 7. and when the program is loaded.
'it does the same check. and if anything is diffrent. the number wont match the length of the characters
'and the program will close and delete the file.
End Sub

Private Sub mytrial_wrongserial()
NotOntop Me
MsgBox Chr(87) & Chr(114) & Chr(111) & Chr(110) & Chr(103) & Chr(32) & Chr(115) & Chr(101) & Chr(114) & Chr(105) & Chr(97) & Chr(108) & Chr(32) & Chr(111) & Chr(114) & Chr(32) & Chr(110) & Chr(97) & Chr(109) & Chr(101) & Chr(46) & Chr(32) & Chr(82) & Chr(101) & Chr(108) & Chr(111) & Chr(97) & Chr(100) & Chr(32) & Chr(116) & Chr(104) & Chr(101) & Chr(32) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(109) & Chr(32) & Chr(97) & Chr(110) & Chr(100) & Chr(32) & Chr(116) & Chr(114) & Chr(121) & Chr(32) & Chr(97) & Chr(103) & Chr(97) & Chr(105) & Chr(110) & Chr(33), vbCritical, Chr(69) & Chr(114) & Chr(114) & Chr(111) & Chr(114)
'if the serial doesnt match for the username and encryption key
'lets tell them that its wrong
End
'lets unload the program. **safety precaution**.
End Sub
