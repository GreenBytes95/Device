XIncludeFile "..\Device.pb"

Global event, duga, PointX.l

Device::Init()

OpenWindow(0, 0, 0, 750, 450, "Example 16 - UInput", #PB_Window_ScreenCentered | #PB_Window_SizeGadget | #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget)
WindowBounds(0, 750, 450, #PB_Default, #PB_Default)

Global *hDevice.Device::Device = Device::Create(WindowID(0), Device::#DEVICE_D3D9, 1, 32, 60, 0)
Device::SetSmoothing(*hDevice, Device::#SMOOTHING_NONE)
Global *hUInput.Device::UInput = Device::UInputCreate(*hDevice, "consolas", 11, Device::#INPUT_DEFAUT, "", "Поиск")

Repeat
  If Device::FrameNext(*hDevice)
    Device::Clear(*hDevice, $FFFFFFFF)
    Device::UInputDraw(*hDevice, *hUInput, 10, 10, 500, 25, Device::#STYLE_CENTER)
    Device::Draw(*hDevice)
  EndIf
  If Device::OnReSize(*hDevice)

  EndIf
  If Device::OnRelease(*hDevice)
    
  EndIf
  
  If Device::OnMouse(*hDevice)
    
    Device::GetMouse(*hDevice, 0, 0, @point)
    
  EndIf
  

  Repeat
    event = WindowEvent()
    If event = #PB_Event_CloseWindow
      Break 2
    EndIf
    Device::OnUInput(*hDevice, *hUInput, event)
  Until event = 0
  Delay(1)
ForEver

Device::Release()
; IDE Options = PureBasic 5.50 (Windows - x86)
; CursorPosition = 9
; EnableXP