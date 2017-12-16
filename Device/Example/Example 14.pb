XIncludeFile "..\Device.pb"

Global event, duga, PointX.l

Device::Init()

OpenWindow(0, 0, 0, 750, 450, "Example 14", #PB_Window_ScreenCentered | #PB_Window_SizeGadget | #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget)
WindowBounds(0, 750, 450, #PB_Default, #PB_Default)

Global *hDevice.Device::Device = Device::Create(WindowID(0), Device::#DEVICE_GDI, 1, 32, 60, 0)
Device::SetSmoothing(*hDevice, Device::#SMOOTHING_NONE)
Global *hScroll.Device::SCROLL = Device::CreateScrollRegion(*hDevice, 0, 0, 750, 450, 1, 1, 2, 10, 0, Device::#STYLE_NONE, $10000000, $FF0094FF)

Repeat
  If Device::FrameNext(*hDevice)
    Device::Clear(*hDevice, $FFFFFFFF)
    Device::ScrollBegin(*hDevice, *hScroll)
    PointX = Device::GetScroll(*hDevice, *hScroll)
    Device::CircleA(*hDevice, 200, 200 + PointX, 50, $FF0094FF)
    Device::RectFill(*hDevice, 300, 300  + PointX, 100, 100, $FFFF9400)
    Device::ScrollEnd(*hDevice, *hScroll, 700)
    Device::Draw(*hDevice)
  EndIf
  If Device::OnReSize(*hDevice)
    
  EndIf
  If Device::OnRelease(*hDevice)
    Device::SetScrollINFO(*hDevice, *hScroll, 0, 0, 0, 0, Device::#STYLE_FULL)
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
    Device::PBOnScroll(*hDevice, *hScroll, event)
  Until event = 0
  Delay(1)
ForEver

Device::Release()
; IDE Options = PureBasic 5.50 (Windows - x86)
; CursorPosition = 12
; FirstLine = 4
; EnableXP