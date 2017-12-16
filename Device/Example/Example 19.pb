XIncludeFile "..\Device.pb"

Global event, duga.l

Device::Init()

Global AngleX.f = 0, AngleY.f = 0, cCube = 1

OpenWindow(0, 0, 0, 128, 160, "Example 19 - View Matrix", #PB_Window_ScreenCentered | #PB_Window_SizeGadget | #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget)
WindowBounds(0, 128, 160, #PB_Default, #PB_Default)

Global *hDevice.Device::Device = Device::Create(WindowID(0), Device::#DEVICE_D3D9, 1, 60, 32, 0)

Global *matrix4x4.Device::D3DXMATRIX = Device::SpecificCamera(*hDevice)

*matrix4x4\_24 = -25

Global Dim *Cube3D.Device::Cube3D(cCube)

For i = 0 To cCube
  
  *Cube3D(i) = Device::CreateObjBox(*hDevice, -10,  20, 20, 10, $FF000000 + Random($FFFFFF))
  
Next

Debug Hex(@*matrix4x4\_11)

Global Mouse.POINT, Mouse2.POINT

GetCursorPos_(@Mouse)
GetCursorPos_(@Mouse2)

Repeat
  
  If Device::FrameNext(*hDevice)
    Device::Clear(*hDevice, $FF000000)
    
    For i = 0 To cCube
    
      Device::RenderObjBox(*hDevice, *matrix4x4, *Cube3D(i), Device::#STYLE_LINE)
      
    Next  
    
    Device::Draw(*hDevice)
  EndIf
  If Device::OnReSize(*hDevice)
    
  EndIf
  If Device::OnRelease(*hDevice)
    
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
; CursorPosition = 21
; FirstLine = 1
; EnableThread
; EnableXP