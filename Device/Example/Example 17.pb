XIncludeFile "..\Device.pb"

Global event, duga, PointX.l

Device::Init()

OpenWindow(0, 0, 0, 750, 450, "Example 17 - BarChart", #PB_Window_ScreenCentered | #PB_Window_SizeGadget | #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget)
WindowBounds(0, 750, 450, #PB_Default, #PB_Default)

Global *hDevice.Device::Device = Device::Create(WindowID(0), Device::#DEVICE_GDI, 1, 32, 60, 0)
;Device::SetSmoothing(*hDevice, Device::#SMOOTHING_NONE)
Global *hUIBarChart.Device::UIBarChart = Device::UIBarChartCreateStructColumn(*hDevice, "Arial", 11)

;*hUIBarChart\UIColor\background = $FFF0F0F0

For t.l = 0 To 9
  
  Device::UIBarChartAddColumn(*hDevice, *hUIBarChart, t * 50, Str(2000 + t) + " г.", $FF0094FF)
  
Next

;Device::UIBarChartReleaseStruct(*hDevice, *hUIBarChart)

Global cX.l = 0, cV.l = 0

Device::Format(*hDevice, Device::#FORMAT_OnWindows, 1)

Repeat
  If Device::FrameNext(*hDevice)
    Device::Clear(*hDevice, $FFFFFFFF)
    Device::UIBarChartDraw(*hDevice, *hUIBarChart, 0, 0, 0, 0, Device::#STYLE_FULL)
    Device::UIBarChartEditColunm(*hDevice, *hUIBarChart, 0, cX)
    If cV = 0
      cX + 1
      If cX > 100
        cV = 1
      EndIf
    EndIf
    If cV = 1
      cX - 1
      If cX <= 0
        cV = 0
      EndIf
    EndIf
    Device::Draw(*hDevice)
  EndIf
  If Device::OnReSize(*hDevice)
    
  EndIf
  If Device::OnRelease(*hDevice)
    Device::UIChartOnRelease(*hDevice, *hUIBarChart)
  EndIf
  
  If Device::OnMouse(*hDevice)
    
    Device::GetMouse(*hDevice, 0, 0, @point)
    
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
; IDE Options = PureBasic 5.60 (Windows - x86)
; CursorPosition = 9
; Folding = e9
; EnableXP