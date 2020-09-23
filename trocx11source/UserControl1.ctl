VERSION 5.00
Begin VB.UserControl UserControl1 
   BorderStyle     =   1  'Fixed Single
   CanGetFocus     =   0   'False
   ClientHeight    =   450
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   495
   ClipControls    =   0   'False
   InvisibleAtRuntime=   -1  'True
   Picture         =   "UserControl1.ctx":0000
   ScaleHeight     =   450
   ScaleWidth      =   495
End
Attribute VB_Name = "UserControl1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
'Default Property Values:
'Const m_def_securitykey = ""
'Const m_def_keyfilename = "regkey.dat"
'Const m_def_securitykey = ""
'Const m_def_keyfilename = "regkey.dat"
Const m_def_username = ""
Const m_def_userserial = ""
'Property Variables:
'Dim m_About As Control
Dim m_securitykey As String
'Dim m_keyfilename As String
'Dim m_securitykey As String
'Dim m_keyfilename As String
Dim m_username As String
Dim m_userserial As String
'Event Declarations:
Event wrongserial()
Event rightserial()
'
'
'
''WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
''MappingInfo=UserControl,UserControl,-1,Refresh
'Public Sub Refresh()
'    UserControl.Refresh
'End Sub
''
'''WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'''MemberInfo=13,3,0,
''Public Property Get securitykey() As String
''    If Ambient.UserMode Then Err.Raise 393
''    securitykey = m_securitykey
''End Property
''
''Public Property Let securitykey(ByVal New_securitykey As String)
''    If Ambient.UserMode Then Err.Raise 382
''    m_securitykey = New_securitykey
''    PropertyChanged "securitykey"
''End Property
''
'''WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'''MemberInfo=13,0,0,regkey.dat
''Public Property Get keyfilename() As String
''    keyfilename = m_keyfilename
''End Property
''
''Public Property Let keyfilename(ByVal New_keyfilename As String)
''    m_keyfilename = New_keyfilename
''    PropertyChanged "keyfilename"
''End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MemberInfo=13,0,0,
Public Property Get username() As String
    username = m_username
End Property

Public Property Let username(ByVal New_username As String)
    m_username = New_username
    PropertyChanged Chr(117) & Chr(115) & Chr(101) & Chr(114) & Chr(110) & Chr(97) & Chr(109) & Chr(101)
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MemberInfo=13,0,0,
Public Property Get userserial() As String
    userserial = m_userserial
End Property

Public Property Let userserial(ByVal New_userserial As String)
    m_userserial = New_userserial
    PropertyChanged Chr(117) & Chr(115) & Chr(101) & Chr(114) & Chr(115) & Chr(101) & Chr(114) & Chr(105) & Chr(97) & Chr(108)
End Property

'Initialize Properties for User Control
Private Sub UserControl_InitProperties()
Set events = Me
Randomize
Number = Int(6000 * Rnd + 1)
m_def_securitykey = Number
'    m_securitykey = m_def_securitykey
'    m_keyfilename = m_def_keyfilename
    m_username = m_def_username
    m_userserial = m_def_userserial
    m_securitykey = m_def_securitykey
'    m_keyfilename = m_def_keyfilename

guesswhat = "Hey fuck your self lil newb hackers"
'dont take offence to this.
'I put it here. because the rest of the program is string less
'another words its harder for crackers to crack
'and this lil msg in the string refrence is bound to piss them off ;)

End Sub

'Load property values from storage
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)

'    m_securitykey = PropBag.ReadProperty("securitykey", m_def_securitykey)
'    m_keyfilename = PropBag.ReadProperty("keyfilename", m_def_keyfilename)
    m_username = PropBag.ReadProperty(Chr(117) & Chr(115) & Chr(101) & Chr(114) & Chr(110) & Chr(97) & Chr(109) & Chr(101), m_def_username)
    m_userserial = PropBag.ReadProperty(Chr(117) & Chr(115) & Chr(101) & Chr(114) & Chr(115) & Chr(101) & Chr(114) & Chr(105) & Chr(97) & Chr(108), m_def_userserial)
    m_securitykey = PropBag.ReadProperty(Chr(115) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121) & Chr(107) & Chr(101) & Chr(121), m_def_securitykey)
'    m_keyfilename = PropBag.ReadProperty("keyfilename", m_def_keyfilename)
'    Set m_About = PropBag.ReadProperty("About", Nothing)
End Sub

'Write property values to storage
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)

'    Call PropBag.WriteProperty("securitykey", m_securitykey, m_def_securitykey)
'    Call PropBag.WriteProperty("keyfilename", m_keyfilename, m_def_keyfilename)
    Call PropBag.WriteProperty(Chr(117) & Chr(115) & Chr(101) & Chr(114) & Chr(110) & Chr(97) & Chr(109) & Chr(101), m_username, m_def_username)
    Call PropBag.WriteProperty(Chr(117) & Chr(115) & Chr(101) & Chr(114) & Chr(115) & Chr(101) & Chr(114) & Chr(105) & Chr(97) & Chr(108), m_userserial, m_def_userserial)
    Call PropBag.WriteProperty(Chr(115) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121) & Chr(107) & Chr(101) & Chr(121), m_securitykey, m_def_securitykey)
'    Call PropBag.WriteProperty("keyfilename", m_keyfilename, m_def_keyfilename)
'    Call PropBag.WriteProperty("About", m_About, Nothing)
End Sub

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MemberInfo=13,3,0,31337
Public Property Get securitykey() As String
    If Ambient.UserMode Then Err.Raise 393
    securitykey = m_securitykey
End Property

Public Property Let securitykey(ByVal New_securitykey As String)
    If Ambient.UserMode Then Err.Raise 382
    m_securitykey = New_securitykey
    PropertyChanged Chr(115) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121) & Chr(107) & Chr(101) & Chr(121)
End Property
'
''WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
''MemberInfo=13,0,0,regkey.dat
'Public Property Get keyfilename() As String
'    keyfilename = m_keyfilename
'End Property
'
'Public Property Let keyfilename(ByVal New_keyfilename As String)
'    m_keyfilename = New_keyfilename
'    PropertyChanged "keyfilename"
'End Property
'
''WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
''MemberInfo=14
'Public Function checknameandserial() As Variant
'
'End Function
'
'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MemberInfo=15
Public Sub about()
MsgBox "Programmed by meth0s in MS Visual Studios Enterprise Edition 6.0" & vbCrLf & vbCrLf & "Contact meth0s by," & vbCrLf & "ICQ#4159440" & vbCrLf & "EMail:TheChosen_one_is@hotmail.com", vbInformation, "About trocx"
End Sub
Public Sub checknameandserial()
On Error Resume Next
Dim charsinfile As Integer
Dim letter As String
Dim justconverted As String
Dim intheend As String
Dim i As Integer

If m_userserial = "" Then Exit Sub
If m_username = "" Then Exit Sub
        charsinfile = Len(m_username) 'find string length
        For i = 1 To charsinfile  'for each character in file
            letter = Mid(m_username, i, 1) 'read next char
            justconverted = Asc(letter) Xor m_securitykey 'and save in file
            intheend = intheend & justconverted
            DoEvents
        Next i
        If m_userserial = intheend Then
            RaiseEvent rightserial
        Else
            RaiseEvent wrongserial
        End If
intheend = ""
justconverted = ""
End Sub
'
''WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
''MemberInfo=15,3,2,0
'Public Property Get About() As Object
'    If Ambient.UserMode Then Err.Raise 393
'    Set About = m_About
'End Property
'
'Public Property Set About(ByVal New_About As Object)
'    If Ambient.UserMode = False Then Err.Raise 383
'    If Ambient.UserMode Then Err.Raise 382
'    Set m_About = New_About
'    PropertyChanged "About"
'End Property
'
