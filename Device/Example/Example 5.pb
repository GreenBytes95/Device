XIncludeFile "..\Device.pb"

Global event

Device::Init()

OpenWindow(0, 0, 0, 750, 450, "Example 5", #PB_Window_ScreenCentered | #PB_Window_SizeGadget | #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget)
WindowBounds(0, 750, 450, #PB_Default, #PB_Default)

Global *hDevice.Device::Device = Device::Create(WindowID(0), Device::#DEVICE_GDI, 1, 32, 32, 0)

Global *hFont.Device::FONT = Device::LoadFontA(*hDevice, "Arial", 10, 0)

Repeat
  If Device::FrameNext(*hDevice)
    Device::Clear(*hDevice, $FF000000)
    Device::StringEx(*hDevice, *hFont, "GreenBytes", 5, 5, 100, 25, $FF000000 + Random($FFFFFF), Device::#STYLE_CENTER)
    Device::String(*hDevice, "あ", 5, 5, 20, 20, $FFFFFFFF, "Arial", 10, Device::#STYLE_BOTTOM | Device::#STYLE_RIGHT)
    Device::Draw(*hDevice)
  EndIf
  If Device::OnReSize(*hDevice)
    
  EndIf
  
  If Device::OnRelease(*hDevice)
    Device::ReleaseFont(*hDevice, *hFont)
    *hFont.Device::FONT = Device::LoadFontA(*hDevice, "Arial", 10, 0)
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
; CursorPosition = 17
; EnableXP