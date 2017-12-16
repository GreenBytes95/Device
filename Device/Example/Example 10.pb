XIncludeFile "..\Device.pb"

Global event

Device::Init()

OpenWindow(0, 0, 0, 750, 450, "Example 10 - GDI", #PB_Window_ScreenCentered | #PB_Window_SizeGadget | #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget)
WindowBounds(0, 750, 450, #PB_Default, #PB_Default)

Global *hDevice.Device::Device = Device::Create(WindowID(0), Device::#DEVICE_GDI, 1, 32, 60, 0)
Global *hImage.Device::IMAGE = Device::LoadImageA(*hDevice, "data\background.png")

Repeat
  If Device::FrameNext(*hDevice)
    Device::Image(*hDevice, *hImage, 0, 0, Device::#STYLE_CENTER)
    Device::Draw(*hDevice)
  EndIf
  If Device::OnReSize(*hDevice)
    
  EndIf
  If Device::OnRelease(*hDevice)
    
    Device::ReleaseImage(*hDevice, *hImage)
    *hImage.Device::IMAGE = Device::LoadImageA(*hDevice, "data\background.png")
    
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