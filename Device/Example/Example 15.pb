XIncludeFile "..\Device.pb"

Global event, duga, PointX.l

Device::Init()

OpenWindow(0, 0, 0, 750, 450, "Example 15", #PB_Window_ScreenCentered | #PB_Window_SizeGadget | #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget)
WindowBounds(0, 750, 450, #PB_Default, #PB_Default)

Global *hDevice.Device::Device = Device::Create(WindowID(0), Device::#DEVICE_GDI, 1, 32, 60, 0)
Device::SetSmoothing(*hDevice, Device::#SMOOTHING_NONE)
Global *hScroll.Device::SCROLL = Device::CreateScrollRegion(*hDevice, 0, 0, 750, 450, 1, 1, 1, 100, 2, Device::#STYLE_NONE, $10000000, $FF0094FF)

Repeat
  If Device::FrameNext(*hDevice)
    Device::Clear(*hDevice, $FFFFFFFF)
    Device::ScrollBegin(*hDevice, *hScroll)
    PointX = Device::GetScroll(*hDevice, *hScroll)
    Debug Device::GetScrollCount(*hDevice, *hScroll)
    Device::CircleA(*hDevice, 200+PointX, 200, 50, $FF0094FF)
    Device::RectFill(*hDevice, 300+PointX, 300, 100, 100, $FFFF9400)
    Device::ScrollEnd(*hDevice, *hScroll, 5)
    Device::Draw(*hDevice)
  EndIf
  If Device::OnReSize(*hDevice)
    Device::SetScrollINFO(*hDevice, *hScroll, 0, 0, 0, 0, Device::#STYLE_FULL)
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
    Device::PBOnScroll(*hDevice, *hScroll, event)
  Until event = 0
  Delay(1)
ForEver

Device::Release()
; IDE Options = PureBasic 5.50 (Windows - x86)
; CursorPosition = 18
; EnableXP