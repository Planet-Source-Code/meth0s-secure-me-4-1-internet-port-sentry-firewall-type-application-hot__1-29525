VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmmain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Secure Me (+) 4.1"
   ClientHeight    =   4680
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6495
   Icon            =   "frmmain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   4680
   ScaleWidth      =   6495
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer tmrlist 
      Interval        =   1
      Left            =   4320
      Top             =   2760
   End
   Begin VB.Frame frmcommand 
      Caption         =   "Command Center:"
      Height          =   615
      Left            =   120
      TabIndex        =   2
      Top             =   0
      Width           =   6255
      Begin VB.CommandButton cmdstart 
         Caption         =   "Start Server"
         Height          =   285
         Left            =   3600
         TabIndex        =   5
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox txtports 
         Height          =   285
         Left            =   120
         TabIndex        =   4
         Text            =   "21,23,80,1080,8080,12345"
         Top             =   240
         Width           =   3375
      End
      Begin VB.CommandButton cmdstop 
         Caption         =   "Stop Server"
         Enabled         =   0   'False
         Height          =   285
         Left            =   4920
         TabIndex        =   3
         Top             =   240
         Width           =   1215
      End
   End
   Begin MSComDlg.CommonDialog cdopensave 
      Left            =   5880
      Top             =   3480
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock serv 
      Index           =   0
      Left            =   3840
      Top             =   2760
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Frame frmstatus 
      Caption         =   "Status Center:"
      Height          =   3375
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   6255
      Begin VB.CommandButton cmdshow 
         Caption         =   "S"
         Height          =   210
         Left            =   120
         TabIndex        =   16
         Top             =   2990
         Width           =   210
      End
      Begin VB.Timer tmrdisconnect 
         Enabled         =   0   'False
         Index           =   0
         Interval        =   5000
         Left            =   4680
         Top             =   2160
      End
      Begin VB.Timer tmrtime 
         Enabled         =   0   'False
         Interval        =   1000
         Left            =   5160
         Top             =   2160
      End
      Begin VB.Timer tmrstuff 
         Interval        =   100
         Left            =   5640
         Top             =   2160
      End
      Begin MSComctlLib.ListView lvstatus 
         Height          =   2415
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   6015
         _ExtentX        =   10610
         _ExtentY        =   4260
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   0
         BackColor       =   16777215
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   4
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Key             =   "time"
            Text            =   "Time"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   1
            Key             =   "rip"
            Text            =   "Remote IP"
            Object.Width           =   2892
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   2
            Key             =   "rhn"
            Text            =   "Remote HostName"
            Object.Width           =   3810
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            SubItemIndex    =   3
            Key             =   "lp"
            Text            =   "Local Port"
            Object.Width           =   1659
         EndProperty
      End
      Begin VB.Label lblservtime 
         Caption         =   "Server Uptime: 0:0:0:00"
         Height          =   255
         Left            =   2640
         TabIndex        =   14
         Top             =   3000
         Width           =   2775
      End
      Begin VB.Label lblservstat 
         Caption         =   "Server Status:"
         Height          =   255
         Left            =   2640
         TabIndex        =   13
         Top             =   2760
         Width           =   2775
      End
      Begin VB.Label lblbytes 
         Caption         =   "Total Bytes Received:"
         Height          =   255
         Left            =   360
         TabIndex        =   12
         Top             =   3000
         Width           =   2415
      End
      Begin VB.Label lblips 
         Caption         =   "Total Computers Connected:"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   2760
         Width           =   2415
      End
   End
   Begin VB.Frame frmoptions 
      Caption         =   "Options Center:"
      Height          =   615
      Left            =   120
      TabIndex        =   6
      Top             =   3960
      Width           =   6255
      Begin VB.CommandButton cmdshowports 
         Caption         =   "Show Ports"
         Height          =   255
         Left            =   5040
         TabIndex        =   15
         Top             =   240
         Width           =   1095
      End
      Begin VB.CommandButton cmdmisc 
         Caption         =   "Misc Options"
         Height          =   255
         Left            =   3720
         TabIndex        =   10
         Top             =   240
         Width           =   1095
      End
      Begin VB.CommandButton cmdcreatelog 
         Caption         =   "Create Log"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Width           =   1095
      End
      Begin VB.CommandButton cmdip 
         Caption         =   "IP Options"
         Enabled         =   0   'False
         Height          =   255
         Left            =   2520
         TabIndex        =   8
         Top             =   240
         Width           =   1215
      End
      Begin VB.CommandButton cmdport 
         Caption         =   "Port Options"
         Height          =   255
         Left            =   1440
         TabIndex        =   7
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.Menu mnuclick 
      Caption         =   "mnuclick"
      Visible         =   0   'False
      WindowList      =   -1  'True
      Begin VB.Menu mnuportscan 
         Caption         =   "&Port Scan"
      End
      Begin VB.Menu mnubar1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuchtcb 
         Caption         =   "Copy Remote HostName"
      End
      Begin VB.Menu mnuriptcb 
         Caption         =   "Copy Remote IP"
      End
      Begin VB.Menu mnucpylocalhost 
         Caption         =   "Copy Local HostName"
      End
      Begin VB.Menu mnuliptcb 
         Caption         =   "Copy Local IP"
      End
      Begin VB.Menu mnucpyattack 
         Caption         =   "Copy Complete Attack Remote"
      End
      Begin VB.Menu bar2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuabout 
         Caption         =   "A&bout"
      End
   End
End
Attribute VB_Name = "frmmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim whatsname As String
Dim whatsserial As String
Dim isreg As String
Dim encrypt As String
Dim InputData As String
Dim lastipdns As String
Dim servstatus As Boolean
Dim computersconnected As Long
Dim totalbytes As Long
Dim mycol As New Collection
Dim sockloaded As Integer
Dim seconds As String
Dim minutes As String
Dim hours As String
Dim registerd As Boolean
Dim days As String
Dim uptime As String


Private Sub cmdmisc_Click()
    frmmiscoptions.Enabled = True
    frmmiscoptions.Visible = True
    Me.Enabled = False
End Sub

Private Sub cmdport_Click()
    frmportoptions.Visible = True
    frmportoptions.Enabled = True
    Me.Enabled = False
End Sub

Private Sub cmdshow_Click()
    frmbytesreceived.Show
    cmdshowports.SetFocus
    frmbytesreceived.SetFocus
End Sub

Private Sub cmdshowports_Click()
On Error Resume Next
Dim z As Integer
    DoEvents
    If servstatus = True Then
        frmopenports.Label1.Caption = "Select a Port from the list to the left."
        Me.Enabled = False
        frmopenports.Visible = True
        frmopenports.Enabled = True
        frmopenports.List1.Clear
        For z = 1 To serv.UBound
            frmopenports.List1.AddItem serv(z).Tag
            frmopenports.List2.AddItem serv(z).Index
            DoEvents
        Next z
        AppActivate frmopenports.Caption
    Else
        MsgBox "Start the server first!", vbExclamation, "Warning!"
    End If
    DoEvents
End Sub

Private Sub cmdstart_Click()
On Error Resume Next
Dim portammounts As Long
Dim portkeys As Long
Dim openingport As Long
Dim aportkeys As String
Dim howmanyports As Long
Dim islast As Long
Dim curchar As String
Dim i As Long
Dim c As Long
Dim newport As String
    lvstatus.SetFocus
    Set mycol = New Collection
    servstatus = True
    portammounts = Len(txtports.Text)

    For i = 1 To portammounts
        islast = islast + 1
        curchar = Mid(txtports.Text, i, 1)
        If curchar = Chr(44) Then
            curchar = ""
            newport = newport + curchar
            If newport = "" Then
            Else
                portkeys = portkeys + 1
                aportkeys = portkeys
                mycol.Add newport, aportkeys
            End If
        newport = ""
        Else
            newport = newport + curchar
            If islast = portammounts Then
                portkeys = portkeys + 2
                aportkeys = portkeys
                mycol.Add newport, aportkeys
            End If
        End If
    Next i

    howmanyports = mycol.Count

    For c = 1 To howmanyports
        Load serv(c)
        openingport = mycol.Item(c)
        serv(c).Tag = mycol.Item(c)
        serv(c).localport = openingport
        serv(c).Listen
    Next c
    
    seconds = "00"
    minutes = "0"
    hours = "0"
    days = "0"
    tmrtime.Enabled = True
    cmdstart.Enabled = False
    cmdstop.Enabled = True
    txtports.Enabled = False
    aportkeys = ""
    portkeys = 0
    i = 0
    c = 0
End Sub

Private Sub cmdstop_Click()
Dim i As Long
Dim h As Long

    For h = mycol.Count To 0
    mycol.Remove (h)
    Next h
    servstatus = False
    
    For i = serv.LBound + 1 To serv.UBound
        serv(i).Close
        Unload serv(i)
    Next i
    
    serv(0).Close
    serv(0).Tag = ""
    serv(0).localport = 0
    
    tmrtime.Enabled = False
    cmdstart.Enabled = True
    txtports.Enabled = True
    cmdstop.Enabled = False
    Set mycol = Nothing
h = 0
i = 0
End Sub

Private Sub Form_Load()
    servstatus = False
    computersconnected = 0
    totalbytes = 0
    sockloaded = 0
    seconds = "00"
    minutes = "0"
    hours = "0"
    days = "0"
    IP_Initialize
    lastipdns = ""
On Error GoTo er
'on error goto er. listed below

Dim InputData  As String
Dim Counter
Dim encrypt As Integer
Dim fuckyou As String
'diming some things


Open Chr(105) & Chr(115) & Chr(114) & Chr(101) & Chr(103) & Chr(46) & Chr(107) & Chr(101) & Chr(121) For Input As #1
'opening our file to check if there registerd.

Do While Not EOF(1)
 Line Input #1, InputData
 Counter = Counter + 1
 Select Case Counter
     Case 1
   whatsname = InputData
     Case 2
   whatsserial = InputData
     Case 3
   isreg = InputData
     Case 4
   encrypt = InputData
 End Select
Loop
Close #1
'just read our file
'now checking for authenticity
encrypt = Trim(encrypt)
If isreg = Chr(84) & Chr(114) & Chr(117) & Chr(101) Then

'if its regged then. check to see if its real.

whatsalllength = whatsname + whatsserial + isreg

If encrypt = Len(whatsalllength) * 7 Then

frmmain.Show
'it works
registerd = True
Else

'if its not real lets kill it
Kill (App.Path & Chr(92) & Chr(105) & Chr(115) & Chr(114) & Chr(101) & Chr(103) & Chr(46) & Chr(107) & Chr(101) & Chr(121))
'delete the bad file

MsgBox Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121) & Chr(32) & Chr(102) & Chr(97) & Chr(108) & Chr(115) & Chr(101), vbCritical, Chr(66) & Chr(121) & Chr(101) & Chr(33)
'msgbox that it was bad security
registerd = False
End
Exit Sub
End If

Else
Me.Enabled = False
Load frmpls
frmpls.Show
'trial
registerd = False
End If

er:
If Err.Number = 53 Then
Me.Enabled = False
Load frmpls
frmpls.Show
registerd = False
ElseIf Err.Number = 0 Then

ElseIf Err.Number = 13 Then
MsgBox Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121) & Chr(32) & Chr(102) & Chr(97) & Chr(108) & Chr(115) & Chr(101), vbCritical, Chr(66) & Chr(121) & Chr(101) & Chr(33)
'msgbox that it was bad security
registerd = False
'if its not real lets kill it
'Kill (App.Path & Chr(92) & Chr(105) & Chr(115) & Chr(114) & Chr(101) & Chr(103) & Chr(46) & Chr(107) & Chr(101) & Chr(121))
'delete the bad file
End
Else

MsgBox Err.Description, vbCritical, "Error"
registerd = False
End If
End Sub

Private Sub Form_Terminate()
    WSACleanup
    End
End Sub

Private Sub Form_Unload(Cancel As Integer)
    WSACleanup
    End
End Sub

Private Sub lvstatus_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 2 Then
            frmmain.PopupMenu mnuclick
    End If
End Sub

Private Sub mnuabout_Click()
On Error Resume Next
    frmabout.Show
    Me.Enabled = False
    frmabout.Enabled = True
    AppActivate frmabout.Caption
End Sub

Private Sub mnuchtcb_Click()
On Error Resume Next
    Clipboard.Clear
    Clipboard.SetText lvstatus.SelectedItem.ListSubItems(2).Text
End Sub

Private Sub mnucpyattack_Click()
On Error Resume Next
    Clipboard.Clear
    Clipboard.SetText "Attack Time: " & lvstatus.SelectedItem.Text & vbCrLf & "Remote HostName: " & lvstatus.SelectedItem.ListSubItems(2).Text & vbCrLf & "Remote Address: " & lvstatus.SelectedItem.ListSubItems(1).Text & vbCrLf & "Local HostName: " & serv(Index).LocalHostName & vbCrLf & "Local Address: " & serv(Index).LocalIP & vbCrLf & "Local Port: " & lvstatus.SelectedItem.ListSubItems(3).Text
End Sub

Private Sub mnucpylocalhost_Click()
On Error Resume Next
    Clipboard.Clear
    Clipboard.SetText serv(Index).LocalHostName
End Sub

Private Sub mnuliptcb_Click()
On Error Resume Next
    Clipboard.Clear
    Clipboard.SetText serv(0).LocalIP
End Sub

Private Sub mnuportscan_Click()
On Error Resume Next
    frmportscan.txtip.Text = lvstatus.SelectedItem.ListSubItems(1).Text
    frmportscan.Show
    frmportscan.SetFocus
    frmportscan.List1.SetFocus
End Sub

Private Sub mnuriptcb_Click()
On Error Resume Next
    Clipboard.Clear
    Clipboard.SetText lvstatus.SelectedItem.ListSubItems(1).Text
End Sub

Private Sub serv_ConnectionRequest(Index As Integer, ByVal requestID As Long)
    Dim frmwarn As New frmwarn
    Dim remoteip As String
    Dim Socket As Variant
    Dim localport As String
    Dim remoteport As String
    Dim remotedns As String

    remotedns = NameByAddr(serv(Index).RemoteHostIP)
    
    If frmportoptions.optall.Value = True Then
    
        serv(Index).Close
        serv(Index).Accept requestID

        remoteip = serv(Index).RemoteHostIP
        remoteport = serv(Index).remoteport
        localport = serv(Index).Tag
    
        If frmmiscoptions.chkbeep.Value = vbChecked Then Beep

        lvstatus.ListItems.Add , , Format(Time)
        lvstatus.ListItems(lvstatus.ListItems.Count).ListSubItems.Add , , remoteip
        lvstatus.ListItems(lvstatus.ListItems.Count).ListSubItems.Add , , remotedns
        lvstatus.ListItems(lvstatus.ListItems.Count).ListSubItems.Add , , localport
        computersconnected = computersconnected + 1
    
        serv(Index).Close
        serv(Index).Listen
    
        If frmmiscoptions.chkshowwarn.Value = vbChecked Then
            Load frmwarn
            frmwarn.Caption = "Connection Attempted - " & Format(Now)
            frmwarn.lbladdress.Caption = "Remote Address: " & remoteip
            frmwarn.lblhostname.Caption = "Remote HostName: " & remotedns
            frmwarn.lbllocalport.Caption = "Local Port: " & localport
            frmwarn.lbllocaladdress.Caption = "Local Address: " & serv(serv.UBound).LocalIP
            frmwarn.lbllocalhostname.Caption = "Local HostName: " & serv(serv.UBound).LocalHostName
            frmwarn.lblremoteport.Caption = "Remote Port: " & remoteport
            frmwarn.lbllocaltime.Caption = "Local Time: " & Format(Time)
            If frmmiscoptions.Check1.Value = vbChecked Then
                ImaPingJ00 remoteip, frmwarn.lblpingreply
            Else
                frmwarn.lblpingreply.Caption = "Ping Reply: Misc Option OFF"
            End If
            frmwarn.Show
            AppActivate frmwarn.Caption
        End If
    
    ElseIf frmportoptions.optseconds.Value = True Then
    
        Load tmrdisconnect(tmrdisconnect.UBound + 1)
        tmrdisconnect(tmrdisconnect.UBound).Enabled = True
        tmrdisconnect(tmrdisconnect.UBound).Interval = frmportoptions.txtall.Text & "000"
        tmrdisconnect(tmrdisconnect.UBound).Tag = serv(Index).Index
        
        serv(Index).Close
        serv(Index).Accept requestID
        
        Load serv(serv.UBound + 1)

        serv(serv.UBound).Tag = serv(Index).Tag
        serv(serv.UBound).localport = serv(Index).Tag
        serv(serv.UBound).Listen
        
        remoteip = serv(Index).RemoteHostIP
        remoteport = serv(Index).remoteport
        localport = serv(Index).Tag
    
        If frmmiscoptions.chkbeep.Value = vbChecked Then Beep

        lvstatus.ListItems.Add , , Format(Time)
        lvstatus.ListItems(lvstatus.ListItems.Count).ListSubItems.Add , , remoteip
        lvstatus.ListItems(lvstatus.ListItems.Count).ListSubItems.Add , , remotedns
        lvstatus.ListItems(lvstatus.ListItems.Count).ListSubItems.Add , , localport
        computersconnected = computersconnected + 1
        
        If frmmiscoptions.chkshowwarn.Value = vbChecked Then
            Load frmwarn
            frmwarn.Caption = "Connection Attempted - " & Format(Now)
            frmwarn.lbladdress.Caption = "Remote Address: " & remoteip
            frmwarn.lblhostname.Caption = "Remote HostName: " & remotedns
            frmwarn.lbllocalport.Caption = "Local Port: " & localport
            frmwarn.lbllocaladdress.Caption = "Local Address: " & serv(serv.UBound).LocalIP
            frmwarn.lbllocalhostname.Caption = "Local HostName: " & serv(serv.UBound).LocalHostName
            frmwarn.lblremoteport.Caption = "Remote Port: " & remoteport
            frmwarn.lbllocaltime.Caption = "Local Time: " & Format(Time)
            If frmmiscoptions.Check1.Value = vbChecked Then
                ImaPingJ00 remoteip, frmwarn.lblpingreply
            Else
                frmwarn.lblpingreply.Caption = "Ping Reply: Misc Option OFF"
            End If
            frmwarn.Show
            AppActivate frmwarn.Caption
        End If
        
    End If
    
    If lvstatus.ListItems.Count = 11 Then
        lvstatus.ColumnHeaders.Item(3).Width = 1900
    End If
End Sub

Private Sub serv_DataArrival(Index As Integer, ByVal bytesTotal As Long)
Dim strdata As String
    serv(Index).GetData strdata
    totalbytes = totalbytes / 2 + bytesTotal
    frmbytesreceived.txtbytes.Text = frmbytesreceived.txtbytes.Text & serv(Index).RemoteHostIP & ":" & serv(Index).Tag & " /-/ " & Format(Time)
    frmbytesreceived.txtbytes.Text = frmbytesreceived.txtbytes.Text & " -> " & strdata & vbCrLf
End Sub

Private Sub tmrdisconnect_Timer(Index As Integer)
    If frmmiscoptions.chkrawmsg.Value = vbChecked Then
        serv(tmrdisconnect(Index).Tag).SendData frmmiscoptions.txtrawmsg.Text & vbCrLf
        serv(tmrdisconnect(Index).Tag).Close
        Unload serv(tmrdisconnect(Index).Tag)
        Unload tmrdisconnect(Index)
    Else
        Unload serv(tmrdisconnect(Index).Tag)
        Unload tmrdisconnect(Index)
    End If
End Sub

Private Sub tmrstuff_Timer()
On Error Resume Next
    If servstatus = True Then
        lblservstat.Caption = "Server Status: Listening"
    ElseIf servstatus = False Then
        lblservstat.Caption = "Server Status: Closed"
    Else
        lblservstat.Caption = "Server Status: Unknown"
    End If
    
    lblbytes.Caption = "Total Bytes Received: " & totalbytes
    lblips.Caption = "Total Computers Connected: " & computersconnected
End Sub

Private Sub tmrtime_Timer()
    seconds = seconds + 1
    If seconds < 10 Then
    bah = seconds
    seconds = "0" + bah
    End If
    If seconds = 60 Then
        seconds = "00"
        minutes = minutes + 1
    End If
    If minutes = 60 Then
        minutes = "00"
        hours = hours + 1
    End If
    If hours = 24 Then
        hours = "00"
        days = days + 1
    End If
    uptime = days & ":" & hours & ":" & minutes & ":" & seconds
    lblservtime.Caption = "Server Uptime: " & uptime
End Sub
