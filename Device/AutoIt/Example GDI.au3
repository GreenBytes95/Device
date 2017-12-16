#include "..\AutoIt\UDF.au3"

_Device_Init("..\Bin\Device.dll")

Local $hGUI = GUICreate("Example GDI", 700, 400, -1, -1, 0x00040000)

GUISetState(@SW_SHOW, $hGUI)

Global $hDevice = _Device_Create($hGUI, $DEVICE_GDI, 1, 32, 60, 0, 0)

Global $vector

While 1
   if _Device_FrameNext($hDevice) Then
	  _Device_Clear($hDevice, 0xFF010101)
	  _Device_Pie($hDevice, -150, 0, 100, 100, $vector, -$vector, 0xFFFFFFFF, $STYLE_CENTER)
	  _Device_PieFill($hDevice, 150, 0, 100, 100, -$vector, $vector, 0xFFFFFFFF, $STYLE_CENTER)
	  _Device_Draw($hDevice)
   EndIf
   if _Device_OnReSize($hDevice) Then

   EndiF
   if _Device_OnRelease($hDevice) Then

   EndiF
   if _Device_OnMouse($hDevice) Then

   EndIf
   $vector = $vector + 1
   if $vector > 360 Then
	  $vector = 0
   EndIf
   Switch GUIGetMsg()
	  Case -3
		 ExitLoop
   EndSwitch
WEnd

_Device_Close($hDevice)

GUIDelete($hGUI)

_Device_Release()