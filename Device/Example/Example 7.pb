XIncludeFile "..\Device.pb"

Global event, duga

Device::Init()

OpenWindow(0, 0, 0, 750, 450, "Example 7", #PB_Window_ScreenCentered | #PB_Window_SizeGadget | #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget)
WindowBounds(0, 750, 450, #PB_Default, #PB_Default)

Global *hDevice.Device::Device = Device::Create(WindowID(0), Device::#DEVICE_GDI, 1, 32, 60, 0)

Repeat
  If Device::FrameNext(*hDevice)
    Device::Clear(*hDevice, $FF010101)
    Device::Pie(*hDevice, -150, 0, 150, 150, duga, duga, $FFFFFFFF, Device::#STYLE_CENTER)
    Device::PieFill(*hDevice, 150, 0, 150, 150, -duga, -duga, $FFFFFFFF, Device::#STYLE_CENTER)
    Device::Draw(*hDevice)
  EndIf
  If Device::OnReSize(*hDevice)
    
  EndIf
  If Device::OnRelease(*hDevice)
    
  EndIf
  
  duga = duga + 1
  
  If duga > 360
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
; CursorPosition = 9
; EnableXP