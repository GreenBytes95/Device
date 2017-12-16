XIncludeFile "..\Device.pb"

Global event

Device::Init()

OpenWindow(0, 0, 0, 750, 450, "Example 6", #PB_Window_ScreenCentered | #PB_Window_SizeGadget | #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget)
WindowBounds(0, 750, 450, #PB_Default, #PB_Default)

Global *hDevice.Device::Device = Device::Create(WindowID(0), Device::#DEVICE_GDI, 1, 32, 60, 0)

Repeat
  If Device::FrameNext(*hDevice)
    Device::Clear(*hDevice, $FF000000)
    Device::LineA(*hDevice, 0, 0, *hDevice\INFO\RECT\right, *hDevice\INFO\RECT\bottom, $FFFFFFFF)
    Device::LineA(*hDevice, 0, *hDevice\INFO\RECT\bottom, *hDevice\INFO\RECT\right, 0, $FFFFFFFF)
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
; CursorPosition = 9
; EnableXP