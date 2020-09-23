Attribute VB_Name = "mdllevel"
Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Public Const HWND_NOTOPMOST = -2
Public Const HWND_TOPMOST = -1
Public Const Flags = SWP_NOMOVE Or SWP_NOSIZE

Sub StayOnTop(the As Form)
Call SetWindowPos(the.hWnd, HWND_TOPMOST, 0, 0, 0, 0, Flags)
End Sub

Sub NotOntop(the As Form)
SetWinOnTop = SetWindowPos(the.hWnd, HWND_NOTOPMOST, 0, 0, 0, 0, Flags)
End Sub
