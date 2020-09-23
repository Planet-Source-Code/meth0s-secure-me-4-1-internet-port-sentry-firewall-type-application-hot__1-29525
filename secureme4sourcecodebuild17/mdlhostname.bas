Attribute VB_Name = "mdlhostname"
Option Explicit

Const WSADescription_Len = 256
Const WSASYS_Status_Len = 128


Private Type HOSTENT
    hName As Long
    hAliases As Long
    hAddrType As Integer
    hLength As Integer
    hAddrList As Long
    End Type


Private Type WSADATA
    wversion As Integer
    wHighVersion As Integer
    szDescription(0 To WSADescription_Len) As Byte
    szSystemStatus(0 To WSASYS_Status_Len) As Byte
    iMaxSockets As Integer
    iMaxUdpDg As Integer
    lpszVendorInfo As Long
    End Type


Declare Function WSACleanup Lib "wsock32" () As Long


Private Declare Function WSAStartup Lib "wsock32" _
    (ByVal VersionReq As Long, WSADataReturn As WSADATA) As Long


Private Declare Function WSAGetLastError Lib "wsock32" () As Long


Private Declare Function gethostbyaddr Lib "wsock32" (addr As Long, addrLen As Long, _
    addrType As Long) As Long


Private Declare Function gethostbyname Lib "wsock32" (ByVal hostname As String) As Long


Private Declare Sub RtlMoveMemory Lib "KERNEL32" (hpvDest As Any, ByVal hpvSource As Long, _
    ByVal cbCopy As Long)

Private Function IsIP(ByVal strIP As String) As Boolean
    On Error Resume Next
    Dim t As String: Dim s As String: Dim i As Integer
    s = strIP
    While InStr(s, ".") <> 0
        t = Left(s, InStr(s, ".") - 1)
        If IsNumeric(t) And Val(t) >= 0 And Val(t) <= 255 Then s = Mid(s, InStr(s, ".") + 1) _
    Else Exit Function
        i = i + 1
    Wend
    t = s
    If IsNumeric(t) And InStr(t, ".") = 0 And Len(t) = Len(Trim(Str(Val(t)))) And _
    Val(t) >= 0 And Val(t) <= 255 And strIP <> "255.255.255.255" And i = 3 Then IsIP = True
    If Err.Number > 0 Then
        Err.Clear
    End If
End Function

Private Function MakeIP(strIP As String) As Long
    On Error Resume Next
    Dim lIP As Long
    lIP = Left(strIP, InStr(strIP, ".") - 1)
    strIP = Mid(strIP, InStr(strIP, ".") + 1)
    lIP = lIP + Left(strIP, InStr(strIP, ".") - 1) * 256
    strIP = Mid(strIP, InStr(strIP, ".") + 1)
    lIP = lIP + Left(strIP, InStr(strIP, ".") - 1) * 256 * 256
    strIP = Mid(strIP, InStr(strIP, ".") + 1)
    If strIP < 128 Then
        lIP = lIP + strIP * 256 * 256 * 256
    Else
        lIP = lIP + (strIP - 256) * 256 * 256 * 256
    End If
    MakeIP = lIP
    If Err.Number > 0 Then
        Err.Clear
    End If
End Function

Function NameByAddr(strAddr As String) As String
    On Error Resume Next
    Dim nRet As Long
    Dim lIP As Long
    Dim strHost As String * 255: Dim strTemp As String
    Dim hst As HOSTENT
    If IsIP(strAddr) Then
        lIP = MakeIP(strAddr)
        nRet = gethostbyaddr(lIP, 4, 2)
        If nRet <> 0 Then
            RtlMoveMemory hst, nRet, Len(hst)
            RtlMoveMemory ByVal strHost, hst.hName, 255
            strTemp = strHost
            If InStr(strTemp, Chr(10)) <> 0 Then strTemp = Left(strTemp, InStr(strTemp, Chr(0)) - 1)
            strTemp = Trim(strTemp)
            NameByAddr = strTemp
        Else
            strAddr = "HostName N/A"
            Exit Function
        End If
    Else
        strAddr = "Invalid IP"
        Exit Function
    End If
    If Err.Number > 0 Then
        strAddr = Err.Description & " " & Err.Number
        Err.Clear
    End If
End Function

Function AddrByName(ByVal strHost As String)
    On Error Resume Next
    Dim hostent_addr As Long
    Dim hst As HOSTENT
    Dim hostip_addr As Long
    Dim temp_ip_address() As Byte
    Dim i As Integer
    Dim ip_address As String
    If IsIP(strHost) Then
        AddrByName = strHost
        Exit Function
    End If
    hostent_addr = gethostbyname(strHost)
    If hostent_addr = 0 Then
        MsgBox "Can't resolve hst", , "9001"
        Exit Function
    End If
    RtlMoveMemory hst, hostent_addr, LenB(hst)
    RtlMoveMemory hostip_addr, hst.hAddrList, 4
    ReDim temp_ip_address(1 To hst.hLength)
    RtlMoveMemory temp_ip_address(1), hostip_addr, hst.hLength
    For i = 1 To hst.hLength
        ip_address = ip_address & temp_ip_address(i) & "."
    Next
    ip_address = Mid(ip_address, 1, Len(ip_address) - 1)
    AddrByName = ip_address
    If Err.Number > 0 Then
        Err.Clear
    End If
End Function

Sub IP_Initialize()
    Dim udtWSAData As WSADATA
    If WSAStartup(257, udtWSAData) Then
        'MsgBox Err.Description, , Err.LastDllError
    End If
End Sub
