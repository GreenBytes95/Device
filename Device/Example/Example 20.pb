XIncludeFile "..\Device.pb"

Global event

Global inifile$ = ".\data\fractal.ini"

Structure sJump
  lx.l
  rx.l
  w.l
  ly.l
  ry.l
  h.l
EndStructure

Global info.s, Angle.f, fX.l, fY.l, fX1.l, fY2.l, lX.l, lY.l, iPos.sJump

Global xCount.l = 1

Structure sLine
  x1.l
  y1.l
  x2.l
  y2.l
EndStructure

Global Dim XLine.sLine(1)

Device::Init()

#FAKSIOMA   = "F++F++F++F"
#FGen       = "-F++F-"
#FLine      = 1
#FStartX    = 0
#FStartY    = 0
#FStartA    = 45
#FAngle     = 45
#FColor     = $FFFFFF00

OpenWindow(0, 0, 0, 750, 450, "Example 20 - Fractal Gen", #PB_Window_ScreenCentered | #PB_Window_SizeGadget | #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget)
WindowBounds(0, 750, 450, #PB_Default, #PB_Default)

Global *hDevice.Device::Device = Device::Create(WindowID(0), Device::#DEVICE_D3D9, 1, 60, 32, 0)

Procedure XNext(HInfo.s = "")
  If HInfo <> ""
    Info = HInfo
  Else
    Info = ReplaceString(info, "F", #FGen)
  EndIf
  
  xCount = 1
  
  ReDim XLine.sLine(xCount)
  
  Angle = #FStartA
  
  fX = 0
  fY = 0
  
  iPos\ly = 0
  iPos\lx = 0
  iPos\ry = 0
  iPos\rx = 0
  
  For i = 1 To Len(Info)
    Select Mid(Info, i, 1)
      Case "F"
        
        fX1 = #FLine * Sin(Angle * #PI/180.0)
        fY1 = #FLine * Cos(Angle * #PI/180.0)
        
        ReDim XLine.sLine(xCount + 1)
        
        XLine(xCount)\x1 = fX
        XLine(xCount)\y1 = fY
        XLine(xCount)\x2 = fX + fX1
        XLine(xCount)\y2 = fY + fY1
        
        If fY < iPos\ly
          iPos\ly = fY
        EndIf
        If fY > iPos\ry
          iPos\ry = fY
        EndIf
        
        If fX < iPos\lx
          iPos\lx = fX
        EndIf
        If fX > iPos\rx
          iPos\rx = fX
        EndIf
        
        fX = fX + fX1
        fY = fY + fY1
        
        If fY < iPos\ly
          iPos\ly = fY
        EndIf
        If fY > iPos\ry
          iPos\ry = fY
        EndIf
        
        If fX < iPos\lx
          iPos\lx = fX
        EndIf
        If fX > iPos\rx
          iPos\rx = fX
        EndIf
        
        
        xCount = xCount + 1
      Case "+"
        Angle = Angle - #FAngle
      Case "-"
        Angle = Angle + #FAngle
    EndSelect
  Next

  iPos\h = (iPos\ry - iPos\ly) / 2
  iPos\w = (iPos\rx - iPos\lx) / 2
  
EndProcedure

Procedure Start()
  XNext(#FAKSIOMA)
EndProcedure

Start()

Repeat
  
  If Device::FrameNext(*hDevice)
    Device::Clear(*hDevice, $FF000000)
    
    lX = (*hDevice\INFO\RECT\right / 2) - iPos\w
    lY = (*hDevice\INFO\RECT\bottom / 2) - iPos\h
    
    For i = 1 To xCount - 1
      Device::LineA(*hDevice, lX + XLine(i)\x1, lY + XLine(i)\y1, lX + XLine(i)\x2, lY + XLine(i)\y2, #FColor)
    Next
    
    If Device::UIButton(*hDevice, $FF404040, $FF606060, $FF202020, 5, 5, 80, 30, Device::#UI_STYLE_COLOR, Device::#STYLE_NONE) = 3
      Start()
    EndIf
    
    If Device::UIButton(*hDevice, $FF404040, $FF606060, $FF202020, 5, 5 + 35, 80, 30, Device::#UI_STYLE_COLOR, Device::#STYLE_NONE) = 3
      XNext()
    EndIf
    
    
    
    
    
    Device::Draw(*hDevice)
  EndIf
  
  If Device::OnReSize(*hDevice)
    
  EndIf
  If Device::OnRelease(*hDevice)
    
  EndIf
  If Device::OnMouse(*hDevice)
    
  EndIf
  
  Repeat
    event = WindowEvent()
    If event = #PB_Event_CloseWindow
      Break 2
    EndIf
  Until event = 0
  Delay(1)
ForEver

Device::Release()
; IDE Options = PureBasic 5.50 (Windows - x86)
; CursorPosition = 32
; FirstLine = 21
; Folding = -
; EnableThread
; EnableXP