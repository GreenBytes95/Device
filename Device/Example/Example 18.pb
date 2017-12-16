XIncludeFile "..\Device.pb"

Global event

OpenWindow(0, 0, 0, 750, 450, "Example 18 - Interface OOP", #PB_Window_ScreenCentered | #PB_Window_SizeGadget | #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget)
WindowBounds(0, 750, 450, #PB_Default, #PB_Default)

Global *iDevice.Device::iDevice = Device::InterfaceCreate(WindowID(0), Device::#DEVICE_D3D9, 1, 32, 60, 0, 0)

Repeat
   
   If *iDevice\FrameNext()
     ;Device::Clear(*hDevice, $FFFFFFFF)
     *iDevice\Rect(0,0,10,10, $FFFFFFFF, 0)
     *iDevice\Draw()
   EndIf
   If *iDevice\OnReSize()
     
   EndIf
   If *iDevice\OnRelease()
     
   EndIf
   
   If *iDevice\OnMouse()
     
   EndIf
  

  Repeat
    event = WindowEvent()
    If event = #PB_Event_CloseWindow
      Break 2
    EndIf
  Until event = 0
  Delay(1)
ForEver
; IDE Options = PureBasic 5.60 (Windows - x86)
; CursorPosition = 7
; Folding = v
; EnableXP