#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         GreenBytes

#ce ----------------------------------------------------------------------------

Global const $DEVICE_NONE = 0x00
Global const $DEVICE_GDI = 0x01
Global const $DEVICE_D3D9 = 0x02
Global const $DEVICE_DC = 0x03
Global const $DEVICE_DCP = 0x04
Global const $DEVICE_OVERLAY = 0x04
Global const $DEVICE_AUTO = 0xFF

Global const $STYLE_NONE = 0
Global const $STYLE_FULL = 1
Global const $STYLE_WIDTH_MAX = 2
Global const $STYLE_HEIGHT_MAX = 4
Global const $STYLE_CENTER = 8
Global const $STYLE_RIGHT = 16
Global const $STYLE_BOTTOM = 32
Global const $STYLE_CENTER_WIDTH = 64
Global const $STYLE_CENTER_HEIGHT = 128
Global const $STYLE_STRING_CENTER = 256

Global const $STYLE_ITALIC = 1
Global const $STYLE_QUALTY_NONE = 2
Global const $STYLE_QUALTY_SMALL = 4
Global const $STYLE_QUALTY_NORM = 8
Global const $STYLE_QUALTY_FULL = 16

Global const $SMOOTHING_NONE = 0x00000000
Global const $SMOOTHING_BLEND = 0x00000001

Global const $UI_STYLE_IMAGE = 0
Global const $UI_STYLE_COLOR = 1
Global const $UI_STYLE_COLIM = 2

Global const $INPUT_DEFAUT = 0
Global const $INPUT_NOKEYBOARD = 1
GLobal const $INPUT_NOSTYLE = 2
Global const $INPUT_NOCONTEXT = 4
Global const $INPUT_NUMBER = 8
Global const $INPUT_TABLET = 16
Global const $INPUT_RECT_CENTER = 32
Global const $INPUT_RECT_RIGHT = 64

Global $___Device_dll

; #FUNCTION# ====================================================================================================================
; Name...........: Init
; Description ...: Инитилизация модуля Device.
; Syntax.........: Init()
; Parameters ....: None
; Return values .: None
; Remarks .......: None
; Example .......; None
; ===============================================================================================================================
Func _Device_Init($str = "..\Bin\Device.dll")
   $___Device_dll = DllOpen($str)
   DllCall($___Device_dll, "none", "Init")
   If @error Then Return SetError(@error, @extended, 0)
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: Release
; Description ...: Закрытие функций Device.
; Syntax.........: Release()
; Parameters ....: None
; Return values .: None
; Remarks .......: None
; Example .......; Device::Init()
;                  Device::Release()
; ===============================================================================================================================
Func _Device_Release()
   DllCall($___Device_dll, "none", "Release")
   DllClose($___Device_dll)
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: Create
; Description ...: Создание контекста окна Device.
; Syntax.........: Create(hWnd.l, device.l = #DEVICE_GDI, begun.l = 1, AlphaFormat.l = 32, fps.l = 30, layred.l = 0, *hDevice.Device = 0)
; Parameters ....: hWnd.l - Handle Window
;                  device.l - Константы типа device
;                  |#DEVICE_GDI - Используется для отрисовки библиотека GDIPlus (GDI+)
;                  |#DEVICE_D3D9 - Используется для отрисовки библиотека D3D9 (DirectX9)
;                  |#DEVICE_NONE - Пустой контекст
;                  begun.l - Отрисовка с момента создания, переменная может иметь значения 0 или 1 [ не используется ]
;                  AlphaFormat.l - Формат в изображения в битности (8, 16, 24, 32)
;                  fps.l - Кол-во кадров в секунду для отрисовки, не рекомендуется ставить больше обновления монитора.
;                  layred.l - Использование #WS_EX_LAYERED для отрисовки в окно.
;                  *hDevice.Device - Контекст окна *Device. (Применяется для содания дополнительного Device)
; Return values .: *hDevice.Device - Контекст окна *Device.
; Remarks .......: None
; Example .......; None
; ===============================================================================================================================
Func _Device_Create($hWnd, $device = $DEVICE_GDI, $begun = 1, $AlphaFormat = 32, $fps = 30, $layred = 0, $hDevice = 0)
   Local $aResult = DllCall($___Device_dll, "handle", "Create", "hwnd", $hWnd, "dword", $device, "dword", $begun, "dword", $AlphaFormat, "dword", $fps, "dword", $layred, "dword", $hDevice)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult[0]
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: Close
; Description ...: Удаление контекста окна Device.
; Syntax.........: Close(*hDevice.Device, nFree.l = 0)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  nFree.l - Отчистка памяти контекста, переменная может иметь значения 0 или 1. 0 - память уничтожается.
; Return values .: None
; Remarks .......: None
; Example .......; None
; ===============================================================================================================================
Func _Device_Close($hDevice)
   ; Close(*hDevice.Device, nFree.l = 0)
   DllCall($___Device_dll, "int", "Close", "handle", $hDevice, "dword", 0)
   If @error Then Return SetError(@error, @extended, 0)
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: Draw
; Description ...: Вывод заднего буфера изображения на экран
; Syntax.........: Draw(*hDevice.Device)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
; Return values .: None
; Remarks .......: None
; Example .......; None
; ===============================================================================================================================
Func _Device_Draw($hDevice)
   DllCall($___Device_dll, "none", "Draw", "handle", $hDevice)
   If @error Then Return SetError(@error, @extended, 0)
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: LoadImageA
; Description ...: Загрузка изображения в память
; Syntax.........: LoadImageA(*hDevice.Device, sFile.s)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  sFile.s - Расположение файла в системе.
; Return values .: *hImage.IMAGE - Контекст изображения. (См. Функцию: LoadImageA, LoadImageMemory )
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI, #DEVICE_D3D9
; ===============================================================================================================================
Func _Device_LoadImageA($hDevice, $sFile, $hImage = 0)
   ;LoadImageA(*hDevice.Device, sFile.s)
   Local $aResult = DllCall($___Device_dll, "handle", "LoadImageA", "handle", $hDevice, "wstr", $sFile, "handle", $hImage)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult[0]
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: LoadImageMemory
; Description ...: Загрузка изображения в память
; Syntax.........: LoadImageMemory(*hDevice.Device, pMem, bytes.l)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  pMem - Указатель на начало памяти изображения.
;                  bytes.l - Размер памяти.
; Return values .: *hImage.IMAGE - Контекст изображения. (См. Функцию: LoadImageA, LoadImageMemory )
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI, #DEVICE_D3D9
; ===============================================================================================================================
Func _Device_LoadImageMemory($hDevice, $pMem, $bytes, $hImage = 0)
   ;LoadImageMemory(*hDevice.Device, pMem, bytes.l)
   Local $aResult = DllCall($___Device_dll, "handle", "LoadImageA", "handle", $hDevice, "dword", $pMem, "dword", $bytes, "handle", $hImage)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult[0]
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: ReleaseImage
; Description ...: Удаление изображения (отчистка памяти).
; Syntax.........: ReleaseImage(*hDevice.Device, *hImage.IMAGE)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  *hImage.IMAGE - Контекст изображения. (См. Функцию: LoadImageA, LoadImageMemory )
; Return values .: None
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI, #DEVICE_D3D9
; ===============================================================================================================================
Func _Device_ReleaseImage($hDevice, $hImage)
   ;ReleaseImage(*hDevice.Device, *hImage.IMAGE)
   DllCall($___Device_dll, "none", "ReleaseImage", "handle", $hDevice, "handle", $hImage)
   If @error Then Return SetError(@error, @extended, 0)
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: LoadFontA
; Description ...: Загрузка шрифта в память
; Syntax.........: LoadFontA(*hDevice.Device, sName.s, size, style.l=0)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  sName.s - Название шрифта в системе.
;                  size - Резмер шрифта.
;                  style - Стиль шрифта. [ недоступно ]
; Return values .: *hFont.FONT - Контекст изображения. (См. Функцию: LoadFontA )
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI, #DEVICE_D3D9
; ===============================================================================================================================
Func _Device_LoadFontA($hDevice, $sName, $size, $style = 0, $hFont = 0)
   ;LoadFontA(*hDevice.Device, sName.s, size, style.l=0)
   Local $aResult = DllCall($___Device_dll, "handle", "LoadFontA", "handle", $hDevice, "wstr", $sName, "dword", $size, "dword", $style, "handle", $hFont)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult[0]
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: ReleaseFont
; Description ...: Удаление шрифта (отчистка памяти).
; Syntax.........: ReleaseFont(*hDevice.Device, *hFont.FONT)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  *hFont.FONT - Контекст изображения. (См. Функцию: LoadFontA )
; Return values .: None
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI, #DEVICE_D3D9
; ===============================================================================================================================
Func _Device_ReleaseFont($hDevice, $hFont)
   ;ReleaseFont(*hDevice.Device, *hFont.FONT)
   Local $aResult = DllCall($___Device_dll, "handle", "ReleaseFont", "handle", $hDevice, "handle", $hFont)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult[0]
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: FrameNext
; Description ...: Отсчет и пропуск кадров для рендера.
; Syntax.........: FrameNext(*hDevice.Device)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
; Return values .: 1 или 0, 1 для продолжеия отрисовки.
; Remarks .......: None
; Example .......; None
; ===============================================================================================================================
Func _Device_FrameNext($hDevice)
   ;FrameNext(*hDevice.Device)
   Local $aResult = DllCall($___Device_dll, "int", "FrameNext", "handle", $hDevice)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult[0]
EndFunc

Func _Device_GetMouse($hDevice)
   ;GetMouse(*hDevice.Device, *x, *y, *point)
   Local $aResult = DllCall($___Device_dll, "int", "GetMouse", "handle", $hDevice, "ptr*", 0, "ptr*", 0, "ptr*", 0)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

Func _Device_SetSmoothing($hDevice, $Smoothing = $SMOOTHING_NONE)
   ;SetSmoothing(*hDevice.Device, Smoothing.l = #SMOOTHING_NONE)
   Local $aResult = DllCall($___Device_dll, "int", "SetSmoothing", "handle", $hDevice, "dword", $Smoothing)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: OnReSize
; Description ...: Контрольное изменение размера.
; Syntax.........: OnReSize(*hDevice.Device)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
; Return values .: 1 или 0, 1 если размер был изменен.
; Remarks .......: После возрата функции OnReSize = 1 необходимо вызвать функцию OnRelease для освобождения памяти.
; Example .......; None
; ===============================================================================================================================
Func _Device_OnReSize($hDevice)
   ;OnReSize(*hDevice.Device)
   Local $aResult = DllCall($___Device_dll, "int", "OnReSize", "handle", $hDevice)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: OnRelease
; Description ...: Освобождение памяти.
; Syntax.........: OnRelease(*hDevice.Device)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
; Return values .: 1 или 0, 1 если необходимо принудительно освободить память.
; Remarks .......: None
; Example .......; None
; ===============================================================================================================================
Func _Device_OnRelease($hDevice)
   ;OnRelease(*hDevice.Device)
   Local $aResult = DllCall($___Device_dll, "int", "OnRelease", "handle", $hDevice)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: OnMinimize
; Description ...: Указывает на свернутость окна.
; Syntax.........: OnMinimize(*hDevice.Device)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
; Return values .: 1 или 0, 1 если окно свернуто.
; Remarks .......: None
; Example .......; None
; ===============================================================================================================================
Func _Device_OnMinimize($hDevice)
   ;OnMinimize(*hDevice.Device)
   Local $aResult = DllCall($___Device_dll, "int", "OnMinimize", "handle", $hDevice)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

Func _Device_OnMouse($hDevice)
   ;OnMouse(*hDevice.Device)
   Local $aResult = DllCall($___Device_dll, "int", "OnMouse", "handle", $hDevice)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: LineA
; Description ...: Вывод линии.
; Syntax.........: LineA(*hDevice.Device, x1.l, y1.l, x2.l, y2.l, color.l, style.l = #STYLE_NONE)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  x1.l - Положение первой линии по координате x.
;                  y1.l - Положение первой линии по координате y.
;                  x2.l - Положение второй линии по координате x.
;                  y2.l - Положение второй линии по координате y.
;                  color.l - ARGB Цвет. ($AARRGGBB)
;                  style.l - Стиль положения элемента
;                  |#STYLE_NONE - Используется по умолчанию. Стиль не применяется.
;                  |#STYLE_LEFT - Стиль прикрепления объекта к левой грани окна.
;                  |#STYLE_TOP - Стиль прикрепления объекта к верхний грани окна.
;                  |#STYLE_RIGHT - Стиль прикрепления объекта к правой грани окна.
;                  |#STYLE_BOTTOM - Стиль прикрепления объекта к нижней грани окна.
;                  |#STYLE_CENTER - Стиль прикрепления объекта к центру окна.
;                  |#STYLE_WIDTH_MAX - Стиль добовляет объекту максимальную ширину.
;                  |#STYLE_HEIGHT_MAX - Стиль добовляет объекту максимальную высоту.
;                  |#STYLE_FULL - Стиль добовляет объекту максимальную ширину и высоту.
; Return values .: None
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI, #DEVICE_D3D9
; ===============================================================================================================================
Func _Device_LineA($hDevice, $x1, $y1, $x2, $y2, $ARGB, $style = $STYLE_NONE)
   ;LineA(*hDevice.Device, x1.l, y1.l, x2.l, y2.l, color.l, style.l = #STYLE_NONE)
   Local $aResult = DllCall($___Device_dll, "int", "LineA", "handle", $hDevice, "dword", $x1, "dword", $y1, "dword", $x2, "dword", $y2, "dword", $ARGB, "dword", $style)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: Arc
; Description ...: Вывод дуги эллипса.
; Syntax.........: Arc(*hDevice.Device, x, y, w, h, startang, sweepang, color, style.l = #STYLE_NONE)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  x.l - Положение по координате x.
;                  y.l - Положение по координате y.
;                  w.l - Размер ширины 4-х угольника.
;                  h.l - Размер высоты 4-х угольника.
;                  startang - начальный вектор поворота (максимальное значение 360).
;                  sweepang - конечный вектор окружности (максимальное значение 360).
;                  color.l - ARGB Цвет. ($AARRGGBB)
;                  style.l - Стиль положения элемента
;                  |#STYLE_NONE - Используется по умолчанию. Стиль не применяется.
;                  |#STYLE_LEFT - Стиль прикрепления объекта к левой грани окна.
;                  |#STYLE_TOP - Стиль прикрепления объекта к верхний грани окна.
;                  |#STYLE_RIGHT - Стиль прикрепления объекта к правой грани окна.
;                  |#STYLE_BOTTOM - Стиль прикрепления объекта к нижней грани окна.
;                  |#STYLE_CENTER - Стиль прикрепления объекта к центру окна.
;                  |#STYLE_WIDTH_MAX - Стиль добовляет объекту максимальную ширину.
;                  |#STYLE_HEIGHT_MAX - Стиль добовляет объекту максимальную высоту.
;                  |#STYLE_FULL - Стиль добовляет объекту максимальную ширину и высоту.
; Return values .: None
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI
; ===============================================================================================================================
Func _Device_Arc($hDevice, $x, $y, $w, $h, $startang, $sweepang, $ARGB, $style = $STYLE_NONE)
   ;Arc(*hDevice.Device, x, y, w, h, startang, sweepang, color, style.l = #STYLE_NONE)
   Local $aResult = DllCall($___Device_dll, "int", "Arc", "handle", $hDevice, "dword", $x, "dword", $y, "dword", $w, "dword", $h, "dword", $startang, "dword", $sweepang , "dword", $ARGB, "dword", $style)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: Bezier
; Description ...: Вывод сплайна Безье.
; Syntax.........: Bezier(*hDevice.Device, x1, y1, x2, y2, x3, y3, x4, y4, color, style.l = #STYLE_NONE)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  x1.l - координата начальной точки сплайна Безье.
;                  y1.l - координата начальной точки сплайна Безье.
;                  x2.l - координата первой контрольной точки сплайна Безье.
;                  y2.l - координата первой контрольной точки сплайна Безье.
;                  x3.l - координата второй контрольной точки сплайна Безье.
;                  y3.l - координата второй контрольной точки сплайна Безье.
;                  x4.l - координата конечной точки сплайна Безье.
;                  y4.l - координата конечной точки сплайна Безье.
;                  color.l - ARGB Цвет. ($AARRGGBB)
;                  style.l - Стиль положения элемента
;                  |#STYLE_NONE - Используется по умолчанию. Стиль не применяется.
;                  |#STYLE_LEFT - Стиль прикрепления объекта к левой грани окна.
;                  |#STYLE_TOP - Стиль прикрепления объекта к верхний грани окна.
;                  |#STYLE_RIGHT - Стиль прикрепления объекта к правой грани окна.
;                  |#STYLE_BOTTOM - Стиль прикрепления объекта к нижней грани окна.
;                  |#STYLE_CENTER - Стиль прикрепления объекта к центру окна.
;                  |#STYLE_WIDTH_MAX - Стиль добовляет объекту максимальную ширину.
;                  |#STYLE_HEIGHT_MAX - Стиль добовляет объекту максимальную высоту.
;                  |#STYLE_FULL - Стиль добовляет объекту максимальную ширину и высоту.
; Return values .: None
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI
; ===============================================================================================================================
Func _Device_Bezier($hDevice, $x1, $y1, $x2, $y2, $x3, $y3, $x4, $y4, $ARGB, $style = $STYLE_NONE)
   ;Bezier(*hDevice.Device, x1, y1, x2, y2, x3, y3, x4, y4, color, style.l = #STYLE_NONE)
   Local $aResult = DllCall($___Device_dll, "int", "Bezier", "handle", $hDevice, "dword", $x1, "dword", $y1, "dword", $x2, "dword", $y2, "dword", $x3, "dword", $y3, "dword", $x4, "dword", $y4, "dword", $ARGB, "dword", $style)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: EllipseA
;                  EllipseFill
; Description ...: Вывод эллипса.
; Syntax.........: EllipseA(*hDevice.Device, x, y, w, h, ARGB, style.l = #STYLE_NONE)
;                  EllipseFill(*hDevice.Device, x.l, y.l, w.l, h.l, ARGB, style.l = #STYLE_NONE)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  x.l - Положение по координате x.
;                  y.l - Положение по координате y.
;                  w.l - Размер ширины эллипса.
;                  h.l - Размер высоты эллипса.
;                  ARGB.l - ARGB Цвет. ($AARRGGBB)
;                  style.l - Стиль положения элемента
;                  |#STYLE_NONE - Используется по умолчанию. Стиль не применяется.
;                  |#STYLE_LEFT - Стиль прикрепления объекта к левой грани окна.
;                  |#STYLE_TOP - Стиль прикрепления объекта к верхний грани окна.
;                  |#STYLE_RIGHT - Стиль прикрепления объекта к правой грани окна.
;                  |#STYLE_BOTTOM - Стиль прикрепления объекта к нижней грани окна.
;                  |#STYLE_CENTER - Стиль прикрепления объекта к центру окна.
;                  |#STYLE_WIDTH_MAX - Стиль добовляет объекту максимальную ширину.
;                  |#STYLE_HEIGHT_MAX - Стиль добовляет объекту максимальную высоту.
;                  |#STYLE_FULL - Стиль добовляет объекту максимальную ширину и высоту.
; Return values .: None
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI
; ===============================================================================================================================
Func _Device_EllipseA($hDevice, $x, $y, $w, $h, $ARGB, $style = $STYLE_NONE)
   ;EllipseA(*hDevice.Device, x, y, w, h, ARGB, style.l = #STYLE_NONE)
   Local $aResult = DllCall($___Device_dll, "int", "EllipseA", "handle", $hDevice, "dword", $x, "dword", $y, "dword", $w, "dword", $h, "dword", $ARGB, "dword", $style)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc


Func _Device_EllipseFill($hDevice, $x, $y, $w, $h, $ARGB, $style = $STYLE_NONE)
   ;EllipseA(*hDevice.Device, x, y, w, h, ARGB, style.l = #STYLE_NONE)
   Local $aResult = DllCall($___Device_dll, "int", "EllipseFill", "handle", $hDevice, "dword", $x, "dword", $y, "dword", $w, "dword", $h, "dword", $ARGB, "dword", $style)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: Image
; Description ...: Вывод изображения.
; Syntax.........: Image(*hDevice.Device, *hImage.IMAGE, x, y, style.l = #STYLE_NONE)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  *hImage.IMAGE - Контекст изображения. (См. Функцию: LoadImageA, LoadImageMemory )
;                  x.l - Положение по координате x.
;                  y.l - Положение по координате y.
;                  ARGB.l - ARGB Цвет. ($AARRGGBB)
;                  style.l - Стиль положения элемента
;                  |#STYLE_NONE - Используется по умолчанию. Стиль не применяется.
;                  |#STYLE_LEFT - Стиль прикрепления объекта к левой грани окна.
;                  |#STYLE_TOP - Стиль прикрепления объекта к верхний грани окна.
;                  |#STYLE_RIGHT - Стиль прикрепления объекта к правой грани окна.
;                  |#STYLE_BOTTOM - Стиль прикрепления объекта к нижней грани окна.
;                  |#STYLE_CENTER - Стиль прикрепления объекта к центру окна.
;                  |#STYLE_WIDTH_MAX - Стиль добовляет объекту максимальную ширину.
;                  |#STYLE_HEIGHT_MAX - Стиль добовляет объекту максимальную высоту.
;                  |#STYLE_FULL - Стиль добовляет объекту максимальную ширину и высоту.
; Return values .: None
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI, #DEVICE_D3D9
; ===============================================================================================================================
Func _Device_Image($hDevice, $hImage, $x, $y, $style = $STYLE_NONE)
   ;Image(*hDevice.Device, *hImage.IMAGE, x, y, style.l = #STYLE_NONE)
   Local $aResult = DllCall($___Device_dll, "int", "Image", "handle", $hDevice, "handle", $hImage, "dword", $x, "dword", $y, "dword", $style)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: ImageRect
; Description ...: Вывод изображения изменяя размер.
; Syntax.........: ImageRect(*hDevice.Device, *hImage.IMAGE, x, y, w, h, style.l = #STYLE_NONE)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  *hImage.IMAGE - Контекст изображения. (См. Функцию: LoadImageA, LoadImageMemory )
;                  x.l - Положение по координате x.
;                  y.l - Положение по координате y.
;                  w.l - Размер ширины изображения.
;                  h.l - Размер высоты изображения.
;                  ARGB.l - ARGB Цвет. ($AARRGGBB)
;                  style.l - Стиль положения элемента
;                  |#STYLE_NONE - Используется по умолчанию. Стиль не применяется.
;                  |#STYLE_LEFT - Стиль прикрепления объекта к левой грани окна.
;                  |#STYLE_TOP - Стиль прикрепления объекта к верхний грани окна.
;                  |#STYLE_RIGHT - Стиль прикрепления объекта к правой грани окна.
;                  |#STYLE_BOTTOM - Стиль прикрепления объекта к нижней грани окна.
;                  |#STYLE_CENTER - Стиль прикрепления объекта к центру окна.
;                  |#STYLE_WIDTH_MAX - Стиль добовляет объекту максимальную ширину.
;                  |#STYLE_HEIGHT_MAX - Стиль добовляет объекту максимальную высоту.
;                  |#STYLE_FULL - Стиль добовляет объекту максимальную ширину и высоту.
; Return values .: None
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI
; ===============================================================================================================================
Func _Device_ImageRect($hDevice, $hImage, $x, $y, $w, $h, $style = $STYLE_NONE)
   ;ImageRect(*hDevice.Device, *hImage.IMAGE, x, y, w, h, style.l = #STYLE_NONE)
   Local $aResult = DllCall($___Device_dll, "int", "Image", "handle", $hDevice, "handle", $hImage, "dword", $x, "dword", $y, "dword", $w, "dword", $h, "dword", $style)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

Func _Device_ImageRectA($hDevice, $hImage, $x, $y, $x2, $y2, $w, $h, $style = $STYLE_NONE)
   ;ImageRectA(*hDevice.Device, *hImage.IMAGE, x, y, x2, y2, w, h, style.l = #STYLE_NONE)
   Local $aResult = DllCall($___Device_dll, "int", "Image", "handle", $hDevice, "handle", $hImage, "dword", $x, "dword", $y, "dword", $x2, "dword", $y2, "dword", $w, "dword", $h, "dword", $style)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: Pie
;                  PieFill
; Description ...: Вывод отрезка пирога.
; Syntax.........: Pie(*hDevice.Device, x, y, w, h, startang, sweepang, ARGB, style.l = #STYLE_NONE)
;                  PieFill(*hDevice.Device, x, y, w, h, startang, sweepang, ARGB, style.l = #STYLE_NONE)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  x.l - Положение по координате x.
;                  y.l - Положение по координате y.
;                  w.l - Размер ширины.
;                  h.l - Размер высоты.
;                  startang - начальный вектор поворота (максимальное значение 360).
;                  sweepang - конечный вектор окружности (максимальное значение 360).
;                  color.l - ARGB Цвет. ($AARRGGBB)
;                  style.l - Стиль положения элемента
;                  |#STYLE_NONE - Используется по умолчанию. Стиль не применяется.
;                  |#STYLE_LEFT - Стиль прикрепления объекта к левой грани окна.
;                  |#STYLE_TOP - Стиль прикрепления объекта к верхний грани окна.
;                  |#STYLE_RIGHT - Стиль прикрепления объекта к правой грани окна.
;                  |#STYLE_BOTTOM - Стиль прикрепления объекта к нижней грани окна.
;                  |#STYLE_CENTER - Стиль прикрепления объекта к центру окна.
;                  |#STYLE_WIDTH_MAX - Стиль добовляет объекту максимальную ширину.
;                  |#STYLE_HEIGHT_MAX - Стиль добовляет объекту максимальную высоту.
;                  |#STYLE_FULL - Стиль добовляет объекту максимальную ширину и высоту.
; Return values .: None
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI
; ===============================================================================================================================
Func _Device_Pie($hDevice, $x, $y, $w, $h, $startang, $sweepang, $ARGB, $style = $STYLE_NONE)
   ;Pie(*hDevice.Device, x, y, w, h, startang, sweepang, ARGB, style.l = #STYLE_NONE)
   Local $aResult = DllCall($___Device_dll, "int", "Pie", "handle", $hDevice, "dword", $x, "dword", $y, "dword", $w, "dword", $h, "dword", $startang, "dword", $sweepang , "dword", $ARGB, "dword", $style)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: Pie
;                  PieFill
; Description ...: Вывод отрезка пирога.
; Syntax.........: Pie(*hDevice.Device, x, y, w, h, startang, sweepang, ARGB, style.l = #STYLE_NONE)
;                  PieFill(*hDevice.Device, x, y, w, h, startang, sweepang, ARGB, style.l = #STYLE_NONE)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  x.l - Положение по координате x.
;                  y.l - Положение по координате y.
;                  w.l - Размер ширины.
;                  h.l - Размер высоты.
;                  startang - начальный вектор поворота (максимальное значение 360).
;                  sweepang - конечный вектор окружности (максимальное значение 360).
;                  color.l - ARGB Цвет. ($AARRGGBB)
;                  style.l - Стиль положения элемента
;                  |#STYLE_NONE - Используется по умолчанию. Стиль не применяется.
;                  |#STYLE_LEFT - Стиль прикрепления объекта к левой грани окна.
;                  |#STYLE_TOP - Стиль прикрепления объекта к верхний грани окна.
;                  |#STYLE_RIGHT - Стиль прикрепления объекта к правой грани окна.
;                  |#STYLE_BOTTOM - Стиль прикрепления объекта к нижней грани окна.
;                  |#STYLE_CENTER - Стиль прикрепления объекта к центру окна.
;                  |#STYLE_WIDTH_MAX - Стиль добовляет объекту максимальную ширину.
;                  |#STYLE_HEIGHT_MAX - Стиль добовляет объекту максимальную высоту.
;                  |#STYLE_FULL - Стиль добовляет объекту максимальную ширину и высоту.
; Return values .: None
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI
; ===============================================================================================================================
Func _Device_PieFill($hDevice, $x, $y, $w, $h, $startang, $sweepang, $ARGB, $style = $STYLE_NONE)
   ;Pie(*hDevice.Device, x, y, w, h, startang, sweepang, ARGB, style.l = #STYLE_NONE)
   Local $aResult = DllCall($___Device_dll, "int", "PieFill", "handle", $hDevice, "dword", $x, "dword", $y, "dword", $w, "dword", $h, "dword", $startang, "dword", $sweepang , "dword", $ARGB, "dword", $style)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: StringEx
; Description ...: Вывод текста.
; Syntax.........: StringEx(*hDevice.Device, *hFont.FONT, text.s, x.l, y.l, w.l, h.l, ARGB, style.l = #STYLE_NONE)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  *hFont.FONT - Контекст изображения. (См. Функцию: LoadFontA )
;                  text.s -　Текст для отображения.
;                  x.l - Положение по координате x.
;                  x.l - Положение по координате x.
;                  y.l - Положение по координате y.
;                  w.l - Размер ширины.
;                  h.l - Размер высоты.
;                  ARGB.l - ARGB Цвет. ($AARRGGBB)
;                  style.l - Стиль положения элемента
;                  |#STYLE_NONE - Используется по умолчанию. Стиль не применяется.
;                  |#STYLE_LEFT - Стиль прикрепления объекта к левой грани окна.
;                  |#STYLE_TOP - Стиль прикрепления объекта к верхний грани окна.
;                  |#STYLE_RIGHT - Стиль прикрепления объекта к правой грани окна.
;                  |#STYLE_BOTTOM - Стиль прикрепления объекта к нижней грани окна.
;                  |#STYLE_CENTER - Стиль прикрепления объекта к центру окна.
;                  |#STYLE_WIDTH_MAX - Стиль добовляет объекту максимальную ширину.
;                  |#STYLE_HEIGHT_MAX - Стиль добовляет объекту максимальную высоту.
;                  |#STYLE_FULL - Стиль добовляет объекту максимальную ширину и высоту.
; Return values .: None
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI, #DEVICE_D3D9
; ===============================================================================================================================
Func _Device_StringEx($hDevice, $hFont, $sText, $x, $y, $w, $h, $ARGB, $style = $STYLE_NONE)
   ;StringEx(*hDevice.Device, *hFont.FONT, text.s, x.l, y.l, w.l, h.l, ARGB, style.l = #STYLE_NONE)
   Local $aResult = DllCall($___Device_dll, "int", "StringEx", "handle", $hDevice, "handle", $hFont, "dword", $x, "dword", $y, "dword", $w, "dword", $h, "dword", $ARGB, "dword", $style)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: String
; Description ...: Вывод текста.
; Syntax.........: String(*hDevice.Device, text.s, x.l, y.l, w.l, h.l, ARGB, font.s = "Arial", size = 10, style.l = #STYLE_NONE)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  text.s -　Текст для отображения.
;                  x.l - Положение по координате x.
;                  x.l - Положение по координате x.
;                  y.l - Положение по координате y.
;                  w.l - Размер ширины.
;                  h.l - Размер высоты.
;                  ARGB.l - ARGB Цвет. ($AARRGGBB)
;                  font.s - Имя шрифта в системе.
;                  size - Размер шрифта.
;                  style.l - Стиль положения элемента
;                  |#STYLE_NONE - Используется по умолчанию. Стиль не применяется.
;                  |#STYLE_LEFT - Стиль прикрепления объекта к левой грани окна.
;                  |#STYLE_TOP - Стиль прикрепления объекта к верхний грани окна.
;                  |#STYLE_RIGHT - Стиль прикрепления объекта к правой грани окна.
;                  |#STYLE_BOTTOM - Стиль прикрепления объекта к нижней грани окна.
;                  |#STYLE_CENTER - Стиль прикрепления объекта к центру окна.
;                  |#STYLE_WIDTH_MAX - Стиль добовляет объекту максимальную ширину.
;                  |#STYLE_HEIGHT_MAX - Стиль добовляет объекту максимальную высоту.
;                  |#STYLE_FULL - Стиль добовляет объекту максимальную ширину и высоту.
; Return values .: None
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI, #DEVICE_D3D9
; ===============================================================================================================================
Func _Device_String($hDevice, $sText, $x, $y, $w, $h, $ARGB, $sFont = "Arial", $size = 10, $style = $STYLE_NONE)
   ;String(*hDevice.Device, text.s, x.l, y.l, w.l, h.l, ARGB, font.s = "Arial", size = 10, style.l = #STYLE_NONE)
   Local $aResult = DllCall($___Device_dll, "int", "String", "handle", $hDevice, "wstr", $sText, "dword", $x, "dword", $y, "dword", $w, "dword", $h, "dword", $ARGB, "wstr", $sFont, "dword", $size, "dword", $style)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: Clear
; Description ...: Отчистка экрана контекста.
; Syntax.........: Clear(*hDevice.Device, ARGB)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  ARGB.l - ARGB Цвет. ($AARRGGBB)
; Return values .: None
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI, #DEVICE_D3D9
; ===============================================================================================================================
Func _Device_Clear($hDevice, $ARGB)
   ;Clear(*hDevice.Device, ARGB)
   Local $aResult = DllCall($___Device_dll, "int", "Clear", "handle", $hDevice, "dword", $ARGB)
   If @error Then Return SetError(@error, @extended, 0)
   Return $aResult
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: Rect
;                  RectFill
; Description ...: Вывод 4-х угольника.
; Syntax.........: Rect(*hDevice.Device, x.l, y.l, w.l, h.l, color.l, style.l = #STYLE_NONE)
;                  RectFill(*hDevice.Device, x.l, y.l, w.l, h.l, color.l, style.l = #STYLE_NONE)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  x.l - Положение по координате x.
;                  y.l - Положение по координате y.
;                  w.l - Размер ширины 4-х угольника.
;                  h.l - Размер высоты 4-х угольника.
;                  color.l - ARGB Цвет. ($AARRGGBB)
;                  style.l - Стиль положения элемента
;                  |#STYLE_NONE - Используется по умолчанию. Стиль не применяется.
;                  |#STYLE_LEFT - Стиль прикрепления объекта к левой грани окна.
;                  |#STYLE_TOP - Стиль прикрепления объекта к верхний грани окна.
;                  |#STYLE_RIGHT - Стиль прикрепления объекта к правой грани окна.
;                  |#STYLE_BOTTOM - Стиль прикрепления объекта к нижней грани окна.
;                  |#STYLE_CENTER - Стиль прикрепления объекта к центру окна.
;                  |#STYLE_WIDTH_MAX - Стиль добовляет объекту максимальную ширину.
;                  |#STYLE_HEIGHT_MAX - Стиль добовляет объекту максимальную высоту.
;                  |#STYLE_FULL - Стиль добовляет объекту максимальную ширину и высоту.
; Return values .: None
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI, #DEVICE_D3D9
; ===============================================================================================================================
Func _Device_Rect($hDevice, $x, $y, $w, $h, $color, $style = 0)
   ; Rect(*hDevice.Device, x.l, y.l, w.l, h.l, color.l, style.l = #STYLE_NONE)
   DllCall($___Device_dll, "none", "Rect", "handle", $hDevice, "int", $x, "int", $y, "int", $w, "int", $h, "int", $color, "int", $style)
   If @error Then Return SetError(@error, @extended, 0)
EndFunc

; #FUNCTION# ====================================================================================================================
; Name...........: Rect
;                  RectFill
; Description ...: Вывод 4-х угольника.
; Syntax.........: Rect(*hDevice.Device, x.l, y.l, w.l, h.l, color.l, style.l = #STYLE_NONE)
;                  RectFill(*hDevice.Device, x.l, y.l, w.l, h.l, color.l, style.l = #STYLE_NONE)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  x.l - Положение по координате x.
;                  y.l - Положение по координате y.
;                  w.l - Размер ширины 4-х угольника.
;                  h.l - Размер высоты 4-х угольника.
;                  color.l - ARGB Цвет. ($AARRGGBB)
;                  style.l - Стиль положения элемента
;                  |#STYLE_NONE - Используется по умолчанию. Стиль не применяется.
;                  |#STYLE_LEFT - Стиль прикрепления объекта к левой грани окна.
;                  |#STYLE_TOP - Стиль прикрепления объекта к верхний грани окна.
;                  |#STYLE_RIGHT - Стиль прикрепления объекта к правой грани окна.
;                  |#STYLE_BOTTOM - Стиль прикрепления объекта к нижней грани окна.
;                  |#STYLE_CENTER - Стиль прикрепления объекта к центру окна.
;                  |#STYLE_WIDTH_MAX - Стиль добовляет объекту максимальную ширину.
;                  |#STYLE_HEIGHT_MAX - Стиль добовляет объекту максимальную высоту.
;                  |#STYLE_FULL - Стиль добовляет объекту максимальную ширину и высоту.
; Return values .: None
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI, #DEVICE_D3D9
; ===============================================================================================================================
Func _Device_RectFill($hDevice, $x, $y, $w, $h, $color, $style = 0)
   ; Rect(*hDevice.Device, x.l, y.l, w.l, h.l, color.l, style.l = #STYLE_NONE)
   DllCall($___Device_dll, "none", "RectFill", "handle", $hDevice, "int", $x, "int", $y, "int", $w, "int", $h, "int", $color, "int", $style)
   If @error Then Return SetError(@error, @extended, 0)
EndFunc

