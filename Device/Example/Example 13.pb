XIncludeFile "..\Device.pb"

Global event, duga, point.point

Device::Init()

OpenWindow(0, 0, 0, 750, 450, "Example 12", #PB_Window_ScreenCentered | #PB_Window_SizeGadget | #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget)
WindowBounds(0, 750, 450, #PB_Default, #PB_Default)

Global *hDevice.Device::Device = Device::Create(WindowID(0), Device::#DEVICE_D3D9, 1, 32, 60, 0)
Device::SetSmoothing(*hDevice, Device::#SMOOTHING_BLEND)

Repeat
  If Device::FrameNext(*hDevice)
    Device::Clear(*hDevice, $FF000000)
    Device::CircleA(*hDevice, 200, 200, 50, $FFFFFFFF);RectFill(*hDevice, point\x - 50, point\y - 50, 100, 100, $FFFFFFFF)
    Device::Draw(*hDevice)
  EndIf
  If Device::OnReSize(*hDevice)
    
  EndIf
  If Device::OnRelease(*hDevice)
    
  EndIf
  
  If Device::OnMouse(*hDevice)
    
    Device::GetMouse(*hDevice, 0, 0, @point)
    
  EndIf
  
  duga = duga + 1
  
  If duga > 50
    duga = 0
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
; CursorPosition = 15
; FirstLine = 3
; EnableXP