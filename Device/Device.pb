﻿; #INDEX# =======================================================================================================================
; Title .........: Device
; Language ......: Русский
; Description ...: Функции для работы с окнами и графикой. Вывод/Построение изображений.
; Author ........: GreenBytes ( https://vk.com/greenbytes )
; Dll ...........: GDI.dll, GDIPlus.dll, d3d9.dll, d3dx9_43.dll
; ===============================================================================================================================

; #VERSION# =====================================================================================================================
; Version ..... .: 1.0.0.2
; ===============================================================================================================================

;{#PROCEDURES# ==================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: InterfaceCreate
;                  Create
; Description ...: Создание контекста окна Device и интерфейса (ООП).
; Syntax.........: InterfaceCreate(hWnd.l, device.l = Device::#DEVICE_GDI, begun.l = 1, AlphaFormat.l = 32, fps.l = 30, layred.l = 0, *hDevice.Device::Device = 0)
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
; Return values .: *hDevice.Device - Контекст окна *Device. - [Create]
; Remarks .......: None
; Example .......; None
; ===============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: Init
; Description ...: Инитилизация модуля Device.
; Syntax.........: Init()
; Parameters ....: None
; Return values .: None
; Remarks .......: None
; Example .......; None
; ===============================================================================================================================

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

; #FUNCTION# ====================================================================================================================
; Name...........: Draw
; Description ...: Вывод заднего буфера изображения на экран
; Syntax.........: Draw(*hDevice.Device)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
; Return values .: None
; Remarks .......: None
; Example .......; None
; ===============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: FrameNext
; Description ...: Отсчет и пропуск кадров для рендера.
; Syntax.........: FrameNext(*hDevice.Device)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
; Return values .: 1 или 0, 1 для продолжеия отрисовки.
; Remarks .......: None
; Example .......; None
; ===============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: OnReSize
; Description ...: Контрольное изменение размера.
; Syntax.........: OnReSize(*hDevice.Device)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
; Return values .: 1 или 0, 1 если размер был изменен.
; Remarks .......: После возрата функции OnReSize = 1 необходимо вызвать функцию OnRelease для освобождения памяти.
; Example .......; None
; ===============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: OnRelease
; Description ...: Освобождение памяти.
; Syntax.........: OnRelease(*hDevice.Device)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
; Return values .: 1 или 0, 1 если необходимо принудительно освободить память.
; Remarks .......: None
; Example .......; None
; ===============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: OnMinimize
; Description ...: Указывает на свернутость окна.
; Syntax.........: OnMinimize(*hDevice.Device)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
; Return values .: 1 или 0, 1 если окно свернуто.
; Remarks .......: None
; Example .......; None
; ===============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: LoadFontA
; Description ...: Загрузка шрифта в память
; Syntax.........: LoadFontA(*hDevice.Device, sName.s, size, style.l=0)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  sName.s - Название шрифта в системе.
;                  size - Резмер шрифта.
;                  style - Стиль шрифта. [ недоступно ]
;                  *hFont.FONT - Укажите для отчистки. Иначе 0.
; Return values .: *hFont.FONT - Контекст изображения. (См. Функцию: LoadFontA )
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI, #DEVICE_D3D9
; ===============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: LoadImageA
; Description ...: Загрузка изображения в память
; Syntax.........: LoadImageA(*hDevice.Device, sFile.s)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  sFile.s - Расположение файла в системе.
;                  *hImage.IMAGE - Укажите для отчистки. Иначе 0.
; Return values .: *hImage.IMAGE - Контекст изображения. (См. Функцию: LoadImageA, LoadImageMemory )
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI, #DEVICE_D3D9
; ===============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: LoadImageMemory
; Description ...: Загрузка изображения в память
; Syntax.........: LoadImageMemory(*hDevice.Device, pMem, bytes.l)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  pMem - Указатель на начало памяти изображения.
;                  bytes.l - Размер памяти.
;                  *hImage.IMAGE - Укажите для отчистки. Иначе 0.
; Return values .: *hImage.IMAGE - Контекст изображения. (См. Функцию: LoadImageA, LoadImageMemory )
; Remarks .......: None
; Example .......; None
; Drawing .......; #DEVICE_GDI, #DEVICE_D3D9
; ===============================================================================================================================

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

; #FUNCTION# ====================================================================================================================
; Name...........: OnMouse
; Description ...: Указывает на изменение состояние мыши.
; Syntax.........: OnMouse(*hDevice.Device)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
; Return values .: 1 или 0, 1 если состояние мышки изменено.
; Remarks .......: None
; Example .......; None
; ===============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: GetMouse
; Description ...: Получение координат мыши.
; Syntax.........: GetMouse(*hDevice.Device, *x, *y, *point)
; Parameters ....: *x - Указатель переменной (4byte), запись координаты X.
;                  *y - Указатель переменной (4byte), запись координаты Y.
;                  *point - Указатель на структуру POINT, запись координат.
; Return values .: None
; Remarks .......: None
; Example .......; None
; ===============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: SetSmoothing
; Description ...: Установка фильтрации отрисовки.
; Syntax.........: SetSmoothing(*hDevice.Device, Smoothing.l = #SMOOTHING_NONE)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  Smoothing.l - Стиль фильтраци.
;                  |#SMOOTHING_NONE - Используется по умолчанию. Стиль не применяется.
;                  |#SMOOTHING_BLEND - Используется фильтрация. Сглаживание углов.
; Return values .: None
; Remarks .......: None
; Example .......; None
; ===============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: SetDrawRect
; Description ...: Установка рамки отрисовки.
; Syntax.........: SetDrawRect(*hDevice.Device, x.l = 0, y.l = 0, w.l = 0, h.l = 0, style.l = #STYLE_NONE)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  x.l - Положение по координате x.
;                  y.l - Положение по координате y.
;                  w.l - Размер ширины.
;                  h.l - Размер высоты.
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
; ===============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: LoadFontB
; Description ...: Загрузка шрифта из памяти.
; Syntax.........: LoadFontB(*hDevice.Device, pMem, bytes.l)
; Parameters ....: *hDevice.Device - Контекст окна *Device. (См. Функцию: Create )
;                  pMem - Адрес в памяти.
;                  bytes.l - Размер шрифта в байтах.
; Return values .: None
; Remarks .......: None
; Example .......; None
; ===============================================================================================================================

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

;}#END-PROCEDURES# ==============================================================================================================
; Description ...: Информация о функциях
; ===============================================================================================================================

DeclareModule Device
  
  ;-----------------------------------------------------------
  ;-       Device Constants
  ;{----------------------------------------------------------
  #DEVICE_NONE = $00
  #DEVICE_GDI = $01
  #DEVICE_D3D9 = $02
  #DEVICE_DC = $03
  #DEVICE_DCP = $04
  #DEVICE_OVERLAY = $04
  #DEVICE_AUTO = $FF

  #STYLE_NONE = 0
  #STYLE_FULL = 1
  #STYLE_WIDTH_MAX = 2
  #STYLE_HEIGHT_MAX = 4
  #STYLE_CENTER = 8
  #STYLE_RIGHT = 16
  #STYLE_BOTTOM = 32
  #STYLE_CENTER_WIDTH = 64
  #STYLE_CENTER_HEIGHT = 128
  #STYLE_STRING_CENTER = 256
  
  #STYLE_ITALIC = 1
  #STYLE_QUALTY_NONE = 2
  #STYLE_QUALTY_SMALL = 4
  #STYLE_QUALTY_NORM = 8
  #STYLE_QUALTY_FULL = 16
  
  #STYLE_LINE = 1
  #STYLE_RECT = 2
  #STYLE_POINT = 4
  
  #SMOOTHING_NONE = $00000000
  #SMOOTHING_BLEND = $00000001
  
  #UI_STYLE_IMAGE = 0
  #UI_STYLE_COLOR = 1
  #UI_STYLE_COLIM = 2
  #UI_STYLE_COLIM_RECT = 3
  
  #INPUT_DEFAUT = 0
  #INPUT_NOKEYBOARD = 1
  #INPUT_NOSTYLE = 2
  #INPUT_NOCONTEXT = 4
  #INPUT_NUMBER = 8
  #INPUT_TABLET = 16
  #INPUT_RECT_CENTER = 32
  #INPUT_RECT_RIGHT = 64
  
  #FORMAT_OnWindows = 0
  
  ;}----------------------------------------------------------
  ;-       UI Constants
  ;{----------------------------------------------------------
  #UI_BARCHART_BYTES = (8 + 32)
  ;}----------------------------------------------------------
  ;-       OpenGL Constants
  ;{----------------------------------------------------------
  #GL_VERSION_1_1 = 1
  ;}----------------------------------------------------------
  ;-       DirectX Constants
  ;{----------------------------------------------------------
  #D3DX_DEFAULT = -1
  #D3DFMT_UNKNOWN = 0
  #D3DADAPTER_DEFAULT = 0
  #D3DPOOL_DEFAULT = 0
  #D3DSWAPEFFECT_DISCARD = 1
  #D3DUSAGE_RENDERTARGET = 1
  #D3DPOOL_MANAGED = 1
  #D3DDEVTYPE_HAL = 1
  #D3DCLEAR_TARGET = 1
  #D3DCLEAR_ZBUFFER = 2
  #D3DFVF_XYZRHW = 4
  #D3DBLEND_SRCALPHA = 5
  #D3DBLEND_INVSRCALPHA = 6
  #D3DXSPRITE_ALPHABLEND = 16
  #D3DRS_SRCBLEND = 19
  #D3DRS_DESTBLEND = 20
  #D3DFMT_A4R4G4B4 = 26
  #D3DRS_ALPHABLENDENABLE = 27
  #D3D_SDK_VERSION = 31
  #D3DXSPRITE_SORT_TEXTURE = 32
  #D3DCREATE_SOFTWARE_VERTEXPROCESSING = 32
  #D3DFVF_DIFFUSE = 64
  #D3DFVF_TEX1 = $100
  
  #D3DRS_SCISSORTESTENABLE = 174
  #D3DRS_LIGHTING = 137
  
  Enumeration
    #D3DPT_POINTLIST = 1
    #D3DPT_LINELIST = 2
    #D3DPT_LINESTRIP = 3
    #D3DPT_TRIANGLELIST = 4
    #D3DPT_TRIANGLESTRIP = 5
    #D3DPT_TRIANGLEFAN = 6
    #D3DPT_FORCE_DWORD = $7fffffff
  EndEnumeration
  
  #D3DX_PI = 3.141592654
   
  #D3DFVF_CUSTOMVERTEX = #D3DFVF_XYZRHW | #D3DFVF_DIFFUSE
  #D3DFVF_TL = #D3DFVF_XYZRHW | #D3DFVF_DIFFUSE | #D3DFVF_TEX1
  
  ;- DXGI_SWAP_CHAIN_FLAG 
  #DXGI_SWAP_CHAIN_FLAG_NONPREROTATED                    = 1
  #DXGI_SWAP_CHAIN_FLAG_ALLOW_MODE_SWITCH                = 2
  #DXGI_SWAP_CHAIN_FLAG_GDI_COMPATIBLE                   = 4
  #DXGI_SWAP_CHAIN_FLAG_RESTRICTED_CONTENT               = 8
  #DXGI_SWAP_CHAIN_FLAG_RESTRICT_SHARED_RESOURCE_DRIVER  = 16
  #DXGI_SWAP_CHAIN_FLAG_DISPLAY_ONLY                     = 32
  ;- DXGI_SWAP_EFFECT 
  #DXGI_SWAP_EFFECT_DISCARD           = 0
  #DXGI_SWAP_EFFECT_SEQUENTIAL        = 1
  #DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL   = 3
  ;- DXGI_MODE_SCALING
  #DXGI_MODE_SCALING_UNSPECIFIED   = 0
  #DXGI_MODE_SCALING_CENTERED      = 1
  #DXGI_MODE_SCALING_STRETCHED     = 2   
  ;- DXGI_MODE_SCANLINE_ORDER
  #DXGI_MODE_SCANLINE_ORDER_UNSPECIFIED         = 0
  #DXGI_MODE_SCANLINE_ORDER_PROGRESSIVE         = 1
  #DXGI_MODE_SCANLINE_ORDER_UPPER_FIELD_FIRST   = 2
  #DXGI_MODE_SCANLINE_ORDER_LOWER_FIELD_FIRST   = 3   
  #DXGI_USAGE_RENDER_TARGET_OUTPUT  = ( 1 << (1 + 4) )
  #DXGI_FORMAT_R8G8B8A8_UNORM = 28
  #D3D11_CREATE_DEVICE_SINGLETHREADED = 0
  
  #D3D_FEATURE_LEVEL_DEFAULT = 0
  #D3D_FEATURE_LEVEL_9_1   = $9100
  #D3D_FEATURE_LEVEL_9_2   = $9200
  #D3D_FEATURE_LEVEL_9_3   = $9300
  #D3D_FEATURE_LEVEL_10_0  = $A000
  #D3D_FEATURE_LEVEL_10_1  = $A100
  #D3D_FEATURE_LEVEL_11_0  = $b000
  #D3D_FEATURE_LEVEL_11_1  = $b100
  #D3D_FEATURE_LEVEL_12_0  = $c000
  #D3D_FEATURE_LEVEL_12_1  = $c100
  
  #D3D_DRIVER_TYPE_HARDWARE = 1
  
  #D3D11_SDK_VERSION  = 7
  ;}----------------------------------------------------------
  ;-       DirectX Interface
  ;{----------------------------------------------------------
  
  ;}----------------------------------------------------------
  ;-       Device Structures
  ;{----------------------------------------------------------
  
  Structure GDIPSTARTUPINPUT
    Version.l
    *Callback
    NoThread.b
    NoCodecs.b
  EndStructure
  
  Structure D3DXMATRIX
    _11.f:_12.f:_13.f:_14.f
    _21.f:_22.f:_23.f:_24.f
    _31.f:_32.f:_33.f:_34.f
    _41.f:_42.f:_43.f:_44.f
  EndStructure
  
  Structure D3DXIMAGE_INFO
     Width.l
     Height.l
     Depth.l
     MipLevels.l
     Format.l
     ResourceType.l
     ImageFileFormat.l;
  EndStructure
  
  Structure D3DXVECTOR2
    x.f
    y.f
  EndStructure
  
  Structure D3DXVECTOR3
    x.f
    y.f
    z.f
  EndStructure
   
  Structure ARGB
    B.a
    G.a
    R.a
    A.a
  EndStructure
  
  Structure D3DTLVERTEX
    x.f
    y.f
    z.f
    rhw.f
    color.l
  EndStructure
  
  Structure D3DTLVERTEX9
    x.f
    y.f
    z.f
    rhw.f
    color.l
    u.f
    v.f
  EndStructure
  
  Structure D3DCOLORVALUE
    r.f
    g.f
    b.f
    a.f
  EndStructure
  
  Structure D3DLIGHT9
    Type.l
    Diffuse.D3DCOLORVALUE
    Specular.D3DCOLORVALUE
    Ambient.D3DCOLORVALUE
    Position.D3DXVECTOR3
    Direction.D3DXVECTOR3
    Range.f
    Falloff.f
    Attenuation0.f
    Attenuation1.f
    Attenuation2.f
    Theta.f
    Phi.f
  EndStructure
  
  Structure D3DPRESENT_PARAMETERS
   BackBufferWidth.l 
   BackBufferHeight.l
   BackBufferFormat.l
   BackBufferCount.l
   MultiSampleType.l
   MultiSampleQuality.l
   SwapEffect.l
   hDeviceWindow.l
   Windowed.l
   EnableAutoDepthStencil.l
   AutoDepthStencilFormat.l
   flags.l
   FullScreen_RefreshRateInHz.l
   PresentationInterval.l
  EndStructure
  
  Structure D3DRECT
    x1.l;
    y1.l;
    x2.l;
    y2.l;
  EndStructure
  
  Structure D3DLOCKED_RECT
    Pitch.l
    *pBits
  EndStructure
  
  Structure D3DTDATA
    RECT.RECT
  EndStructure
  
  Structure D3DVIEWPORT9
    X.l;
    Y.l;
    Width.l;
    Height.l;
    MinZ.f;
    MaxZ.f;
  EndStructure
    
  Structure DXGI_RATIONAL
    Numerator.l
    Denominator.l
  EndStructure
  
  ;- DXGI_MODE_DESC ; 32Bit 28 Byte, 64Bit 28 Byte
  Structure DXGI_MODE_DESC
    Width.l
    Height.l
    RefreshRate.DXGI_RATIONAL
    Format.l                      ;DXGI_FORMAT Konstante ; 32Bit 4 Byte, 64Bit 4 Byte
    ScanlineOrdering.l            ;DXGI_MODE_SCANLINE_ORDER Konstante ; 32Bit 4 Byte, 64Bit 4 Byte
    Scaling.l                     ;DXGI_MODE_SCALING ; 32Bit 4 Byte, 64Bit 4 Byte
  EndStructure
  
  ;- DXGI_SAMPLE_DESC ; 32Bit 8 Byte, 64Bit 8 Byte
  Structure DXGI_SAMPLE_DESC
    Count.l
    Quality.l
  EndStructure
  
  ;- DXGI_SWAP_CHAIN_DESC
  Structure DXGI_SWAP_CHAIN_DESC ; 32Bit 60 Byte, 64Bit 72 Byte
    BufferDesc.DXGI_MODE_DESC
    SampleDesc.DXGI_SAMPLE_DESC
    BufferUsage.l                   ; DXGI_USAGE Konstante ; 32Bit 4 Byte, 64Bit 4 Byte
    BufferCount.i
    OutputWindow.i
    Windowed.l
    SwapEffect.l                     ;DXGI_SWAP_EFFECT ; 32Bit 4 Byte, 64Bit 4 Byte
    Flags.i
  EndStructure
  
  Structure Cube3D
    _11.Device::D3DXVECTOR3
    _12.Device::D3DXVECTOR3
    _13.Device::D3DXVECTOR3
    _14.Device::D3DXVECTOR3
    _21.Device::D3DXVECTOR3
    _22.Device::D3DXVECTOR3
    _23.Device::D3DXVECTOR3
    _24.Device::D3DXVECTOR3
    
    ; Координаты в 2D каждой точки
    
    j11.POINT
    j12.POINT
    j13.POINT
    j14.POINT
    j21.POINT
    j22.POINT
    j23.POINT
    j24.POINT
    
    ; Внешняя информация
    
    color.l
    
  EndStructure
  
  Structure FamilyFontGDIPlus
    hFamily.l
    hFont.l
  EndStructure
  
  Structure FRECT
    x.f
    y.f
    w.f
    h.f
  EndStructure

  Structure SCROLL
    x.l
    y.l
    w.l
    h.l
    scroll.l
    region.l
    speed.l
    speed_end.l
    type.l
    style.l
    scroll_back.l
    scroll_color.l
    pos_scroll.l
    pos_scroll_t.f
    pos_scroll_a.f
    pos_scroll_n.f
    scroll_temp.f
    pos_scroll_b.f
    scroll_dat.f
    w_scroll.w
    device.l
  EndStructure
  
  Structure UIKey
    ctrl.l
  EndStructure
  
  Structure UIStyle
    style.l
    padding.l
    SizeText.l
  EndStructure
  
  Structure UIfunc
    ENTER.l
  EndStructure
  
  Structure UIVector
    x.l
    y.l
    w.l
    h.l
    xw.l
    yh.l
  EndStructure
  
  Structure UIColor
    background.l
    border.l
    cursor.l
    text.l
    focus.l
    selec_t.l
    selec_text.l
    placeholder.l
  EndStructure
  
  Structure UIBarChart
    column.l    ; AllocateMemory (Colunm 8 bytes) [ size, AGB ]
    count.l     ; Count column
    full.l      ; Size max
    ShowName.b  ; ShowName 0 - 1
    hFont.l     ; *hFont pointer
    nfont.s     ; Name Font
    sfont.l     ; Size Font
    UIColor.UIColor
    UIStyle.UIStyle
  EndStructure
  
  Structure UInput
    Device.l    ; Device
    focus.b     ; 0 - 1
    hFont.l     ; *hFont pointer
    UInStyle.l  ; Style Text Input
    UICursor.l  ; Cursor count char
    UInput.s    ; Text Input
    placehold.s ; text standart input.
    FName.s     ; name font
    FSize.l     ; size font
    UIColor.UIColor
    UIVector.UIVector
    UInVector.UIVector
    UIcPOINT.UIVector
    UIfunc.UIfunc
    UIStyle.UIStyle
    UIKey.UIKey
  EndStructure
  
  Structure FONT
    id3dxf.ID3DXFont
    RECT.RECT
    FRECT.FRECT
    hFamily.l
    hFont.l
    hFormat.l
  EndStructure
  
  Structure IMAGE
    d3dtexture.IDirect3DTexture9
    d3dsprite.ID3DXSprite
    d3dpos.D3DXVECTOR3
    d3dinfo.D3DXIMAGE_INFO
    pStream.IUnknown
    pMem.l
    hGDI.l
  EndStructure
  
  Structure ULONG_PTR 
    Data.l
  EndStructure
  
  Structure D3D9
    pD3D.IDirect3D9
    pd3dDevice.IDirect3DDevice9
    pVB.IDirect3DVertexBuffer9
    d3dpp.D3DPRESENT_PARAMETERS
    d3dline.ID3DXLine
    qV.D3DTLVERTEX[362]
    qL.D3DXVECTOR2[2]
    pBackBuffer.IDirect3DSurface9
    pScissor.RECT
    pBackDC.i
    *pVertices
  EndStructure
  
  Structure GDI
    BLENDFUNCTION.BLENDFUNCTION
    BITMAP.BITMAP
    size.SIZE
    Point.POINT
    hGraphics.l
    hImage.l
    HBITMAP.l
    hContext.l
    hDC.l
    hHDC.l
    hsObj.l
    hBrush.l
    hPen.l
  EndStructure
  
  Structure FPS
    time.l
    tick.l
    count.l
    tframe.l
    frame.l
  EndStructure
  
  Structure MOUSE
    x.l
    y.l
    x1.l
    x2.l
    lb.l
    rb.l
    m.l
    db.l
    dr.l
  EndStructure
  
  Structure Thread
    WinID.l
    WinHandle.l
    ThreadID.l
    close.l
  EndStructure
  
  Structure INFO
    RECT.RECT
    tRECT.RECT
    MOUSE.MOUSE
    hWnd.l
    Device.l
    DeviceOrig.l
    FPS.FPS
    AlphaBlend.l
    fpsTick.l
    LAYERED.l
    THREAD.Thread
    OnRelease.l
    OnMinimize.l
    OnWindows.l
  EndStructure
  
  Structure Device
    INFO.INFO
    GDI.GDI
    D3D9.D3D9
  EndStructure
  
  Structure iiDevice 
    *vt
    Device.l
  EndStructure
  
  ;}----------------------------------------------------------
  ;-       Device Declare
  ;{----------------------------------------------------------
  Declare.l Init()
  Declare.l Release()
  Declare.l Create(hWnd.l, device.l = #DEVICE_GDI, begun.l = 1, AlphaFormat.l = 32, fps.l = 30, layred.l = 0, *hDevice.Device = 0)
  Declare.l Close(*hDevice.Device, nFree.l = 0)
  Declare.l Draw(*hDevice.Device)
  Declare.l LoadImageA(*hDevice.Device, sFile.s, *hImage.IMAGE = 0, Width.l = -1, Height.l = -1)
  Declare.l LoadImageMemory(*hDevice.Device, pMem, bytes.l, *hImage.IMAGE = 0, Width.l = -1, Height.l = -1)
  Declare.l ReleaseImage(*hDevice.Device, *hImage.IMAGE)
  Declare.l LoadFontB(*hDevice.Device, pMem, bytes.l)
  Declare.l LoadFontA(*hDevice.Device, sName.s, size, style.l=#STYLE_QUALTY_FULL, *hFont.FONT = 0)
  Declare.l ReleaseFont(*hDevice.Device, *hFont.FONT)
  Declare.l FrameNext(*hDevice.Device)
  Declare.l GetMouse(*hDevice.Device, *x, *y, *point)
  Declare.l SetSmoothing(*hDevice.Device, Smoothing.l = #SMOOTHING_NONE)
  Declare.l Format(*hDevice.Device, Format.l, Value.l = 0)
  Declare.l OnReSize(*hDevice.Device)
  Declare.l OnRelease(*hDevice.Device)
  Declare.l OnMinimize(*hDevice.Device)
  Declare.l OnMouse(*hDevice.Device)
  Declare.l SetDrawRect(*hDevice.Device, x.l = 0, y.l = 0, w.l = 0, h.l = 0, style.l = #STYLE_NONE)
  Declare.l Rect(*hDevice.Device, x.l, y.l, w.l, h.l, color.l, style.l = #STYLE_NONE)
  Declare.l RectFill(*hDevice.Device, x.l, y.l, w.l, h.l, color.l, style.l = #STYLE_NONE)
  Declare.l LineA(*hDevice.Device, x1.l, y1.l, x2.l, y2.l, color.l, style.l = #STYLE_NONE)
  Declare.l Arc(*hDevice.Device, x, y, w, h, startang, sweepang, color, style.l = #STYLE_NONE)
  Declare.l Bezier(*hDevice.Device, x1, y1, x2, y2, x3, y3, x4, y4, color, style.l = #STYLE_NONE)
  Declare.l EllipseA(*hDevice.Device, x, y, w, h, ARGB, style.l = #STYLE_NONE)
  Declare.l EllipseFill(*hDevice.Device, x.l, y.l, w.l, h.l, ARGB, style.l = #STYLE_NONE)
  Declare.l Image(*hDevice.Device, *hImage.IMAGE, x, y, style.l = #STYLE_NONE)
  Declare.l ImageSetRotateFlip(*hDevice.Device, *hImage.IMAGE, iRotateFlip.i)
  Declare.l ImageRect(*hDevice.Device, *hImage.IMAGE, x, y, w, h, style.l = #STYLE_NONE)
  Declare.l ImageRectA(*hDevice.Device, *hImage.IMAGE, x, y, x2, y2, w, h, style.l = #STYLE_NONE)
  Declare.l Pie(*hDevice.Device, x, y, w, h, startang, sweepang, ARGB, style.l = #STYLE_NONE)
  Declare.l PieFill(*hDevice.Device, x, y, w, h, startang, sweepang, ARGB, style.l = #STYLE_NONE)
  Declare.l StringEx(*hDevice.Device, *hFont.FONT, text.s, x.l, y.l, w.l, h.l, ARGB, style.l = #STYLE_NONE)
  Declare.l String(*hDevice.Device, text.s, x.l, y.l, w.l, h.l, ARGB, font.s = "Arial", size = 10, style.l = #STYLE_NONE)
  Declare.l CircleA(*hDevice.Device, x, y, radius, ARGB, style.l = #STYLE_NONE)
  Declare.l CircleFill(*hDevice.Device, x, y, radius, ARGB, style.l = #STYLE_NONE)
  Declare.l Clear(*hDevice.Device, ARGB)
  Declare.l UIButton(*hDevice.Device, *ptr1, *ptr2, *ptr3, x.l, y.l, w.l, h.l, style.l = #UI_STYLE_IMAGE, wstyle.l = #STYLE_NONE)
  Declare.l CreateScrollRegion(*hDevice.Device, x.l, y.l, w.l, h.l, scroll.l = 1, region.l = 1, speed_end.l = 3, speed.l = 10, type.l = 0, style.l = #STYLE_NONE, scroll_back.l = $10000000, scroll_color.l = $40000000)
  Declare.l ScrollBegin(*hDevice.Device, *hScroll.SCROLL)
  Declare.l ScrollEnd(*hDevice.Device, *hScroll.SCROLL, Max.l)
  Declare.l GetScroll(*hDevice.Device, *hScroll.SCROLL)
  Declare.l GetScrollCount(*hDevice.Device, *hScroll.SCROLL)
  Declare.l OnScroll(*hDevice.Device, *hScroll.SCROLL, event.l, wParam.l = 0)
  Declare.l SetScrollRegion(*hDevice.Device, *hScroll.SCROLL, x.l, y.l, w.l, h.l, style.l = #STYLE_NONE)
  Declare.l ResetScroll(*hDevice.Device, *hScroll.SCROLL)
  Declare.l StringCRLF(*hDevice.Device, *hFont.FONT, text.s, x.l, y.l, w.l, h.l, ARGB, style.l = #STYLE_NONE, interval.l = 25, line.l = $FFFF, Delimiter.s = "\r", style_d.l = 0)
  Declare.l StringLine(*hDevice.Device, text.s, line.l = $FFFF, Delimiter.s = "\r")
  Declare.l StringInfoW(*hDevice.Device, *hFont.FONT, text.s)
  Declare.l StringInfoH(*hDevice.Device, *hFont.FONT, text.s)
  Declare.l StringInfoFONT(*hDevice.Device, *hFont.FONT, text.s)
  Declare.l UInputCreate(*hDevice.Device, nfont.s, sfont.l, UIStyle.l = #INPUT_DEFAUT, text.s = "", placehold.s = "")
  Declare.l UInputClose(*hDevice.Device, *hUInput.UInput)
  Declare.l UInputOnRelease(*hDevice.Device, *hUInput.UInput)
  Declare.l UInputDraw(*hDevice.Device, *hUInput.UInput, x.l, y.l, w.l, h.l, Style.l = #STYLE_NONE)
  Declare.l OnUInput(*hDevice.Device, *hUInput.UInput, event.l, wParam.l = -1)
  Declare.l UIBarChartCreateStructColumn(*hDevice.Device, nfont.s = "Arial", sfont.l = 9)
  Declare.l UIBarChartAddColumn(*hDevice.Device, *hUIBarChart.UIBarChart, size.l, Name.s = "", color.l = 0)
  Declare.l UIBarChartDraw(*hDevice.Device, *hUIBarChart.UIBarChart, x.l, y.l, w.l, h.l, style.l = #STYLE_NONE)
  Declare.l UIBarChartReleaseStruct(*hDevice.Device, *hUIBarChart.UIBarChart)
  Declare.l UIBarChartEditColunm(*hDevice.Device, *hUIBarChart.UIBarChart, ID.l, size.l, Name.s = "", color.l = 0)
  Declare.l UIChartOnRelease(*hDevice.Device, *hUIBarChart.UIBarChart)
  
  Declare.l ArcEx(*hDevice.Device, x, y, w, h, startang, sweepang, color, pwidth.l, style.l = #STYLE_NONE)
  
  Declare.l WorldToScreen(*D3DXMATRIX.Device::D3DXMATRIX, *D3DXVECTOR3.Device::D3DXVECTOR3, *RECT.RECT, *POINT.POINT)
  Declare.l SpecificCamera(*hDevice.Device)
  Declare.l CreateObjBox(*hDevice.Device, x.f, y.f, z.f, size.f, color.l)
  Declare.l RenderObjBox(*hDevice.Device, *matrix4x4.D3DXMATRIX , *Cube3D.Cube3D, style.l = #STYLE_NONE)
  Declare.l WorldOfObjBox(*hDevice.Device, *matrix4x4.D3DXMATRIX , *Cube3D.Cube3D)
  
  Declare.l DebugFps(*hDevice.Device)
  ;}----------------------------------------------------------
  ;-       Device Var
  ;{----------------------------------------------------------
  
  ;}----------------------------------------------------------
  ;-       Device Interface
  ;{----------------------------------------------------------
  Interface iDevice
    ImageRect(*hImage.IMAGE, x, y, w, h, style.l = #STYLE_NONE)
    Image(*hImage.IMAGE, x, y, style.l = #STYLE_NONE)
    EllipseA(x, y, w, h, ARGB, style.l = #STYLE_NONE)
    Bezier(x1, y1, x2, y2, x3, y3, x4, y4, color, style.l = #STYLE_NONE)
    Arc(x, y, w, h, startang, sweepang, color, style.l = #STYLE_NONE)
    LineA(x1.l, y1.l, x2.l, y2.l, color.l, style.l = #STYLE_NONE)
    RectFill(x.l, y.l, w.l, h.l, color.l, style.l = #STYLE_NONE)
    Rect(x.l, y.l, w.l, h.l, color.l, style.l = #STYLE_NONE)
    Format(Format.l, Value.l = 0)
    LoadFontB(pMem, bytes.l)
    SetDrawRect(x.l = 0, y.l = 0, w.l = 0, h.l = 0, style.l = #STYLE_NONE)
    SetSmoothing(Smoothing.l = #SMOOTHING_NONE)
    GetMouse(*x, *y, *point)
    OnMouse()
    OnMinimize()
    OnRelease()
    OnReSize()
    FrameNext()
    ReleaseImage(*hImage.IMAGE)
    ReleaseFont(*hFont.FONT)
    LoadFontA(sName.s, size, style.l=#STYLE_QUALTY_FULL, *hFont.FONT = 0)
    LoadImageMemory(pMem, bytes.l, *hImage.IMAGE = 0)
    LoadImageA(sFile.s, *hImage.IMAGE = 0)
    Draw()
    Free()
  EndInterface
  
  Declare.l InterfaceCreate(hWnd.l, device.l = #DEVICE_GDI, begun.l = 1, AlphaFormat.l = 32, fps.l = 30, layred.l = 0, *hDevice.Device = 0)
  ;}
  
EndDeclareModule

Module Device
  ;-----------------------------------------------------------
  ;-       Device -> Prototype
  ;{----------------------------------------------------------
  Prototype GdiplusStartup(*struct, *ulongptr,*ptr)
  Prototype GdipCreateFromHWND(hwnd.l, *ptr)
  Prototype GdipSetLineLinearBlend(hLineGradientBrush, nFocus.f, nScale.f=1)
  Prototype GdipFillRectangleI(hGraphics, hBrush , iX, iY, iWidth, iHeight)
  Prototype GdipCreateLineBrush(*pPointF1, *pPointF2, iARGBClr1, iARGBClr2, iWrapMode, *ptr=0)
  Prototype GdipDeleteBrush(hBrush)
  Prototype GdipDeleteGraphics(hGraphics)
  Prototype GdiplusShutdown(*giGDIPToken)
  Prototype GdipFillPieI(handleGraphics, handleBrush, intX, intY, intW, intH, FloatStartAngle.f, FSweepAngle.f)
  Prototype GdipCreateSolidFill(iARGB.l = $FF000000, *ptr=0)
  Prototype GdipGraphicsClear(hGraphics, iARGB = $FF000000)
  Prototype GdipCreateFontFamilyFromName(sFamily.p-unicode , ptr=0, *handle=0)
  Prototype GdipCreateFont(hFamily, fSize.f, iStyle=0, iUnit=3, *ptr=0)
  Prototype GdipDrawString(hGraphics, sString.p-unicode, minusone, hFont, *tLayout, hFormat, hBrush)
  Prototype GdipDeleteFontFamily(hFamily)
  Prototype GdipDeleteFont(hFont)
  Prototype GdipSetSmoothingMode(hGraphics, iSmooth)
  Prototype GdipCreateTexture(*hImage, iWrapMode, *ptr=0)
  Prototype GdipLoadImageFromFileICM(sFileName.p-unicode, *ptr=0)
  Prototype GdipCreateBitmapFromHBITMAP(hBmp, hPal=0, *ptr=0)
  Prototype GdipCreateHBITMAPFromBitmap(hBitmap, *ptr=0, iARGB = $FF000000)
  Prototype GdipCreateBitmapFromGraphics(int, int2, handle, *ptr)
  Prototype GdipGetImageGraphicsContext(handle, *ptr)
  Prototype GdipDrawImageI(handleGraphics, hImage, intX, intY)
  Prototype GdipCreateFromHDC(hDC.l, *ptr)
  Prototype GdipGetDC(hGraphics, *ptr)
  Prototype GdipDrawRectangle(hGraphics, hPen, x.f, y.f, w.f, h.f)
  Prototype GdipCreatePen1(Color.l=$FF000000, W.f=1, Unit=2, *ptr=0)
  Prototype GdipCreatePen2(hBrush, W.f=1, Unit=2, *ptr=0)
  Prototype GdipSetPenColor(hPen, ARGB.l)
  Prototype GdipSetSolidFillColor(hBrush, ARGB.l)
  Prototype GdipDrawArc(hGraphics, hPen, x.f, y.f, w.f, h.f, startang.f, sweepang.f)
  Prototype GdipDrawBezier(hGraphics, hPen, x1.f, y1.f, x2.f, y2.f, x3.f, y3.f, x4.f, y4.f)
  Prototype GdipDrawEllipse(hGraphics, hPen, x.f, y.f, w.f, h.f)
  Prototype GdipDrawImage(hGraphics, hImage, x.f, y.f)
  Prototype GdipDrawImageRect(hGraphics, hImage, x.f, y.f, w.f, h.f)
  Prototype GdipDrawLine(hGraphics, hPen, x1.f, y1.f, x2.f, y2.f)
  Prototype GdipLoadImageFromFile(sFileName.p-unicode, *ptr=0)
  Prototype GdipLoadImageFromStream(hStream, *ptr=0)
  Prototype GdipDrawPie(hGraphics, hPen, x.f, y.f, w.f, h.f, startang.f, sweepang.f)
  Prototype GdipCreateStringFormat(iFormat, LangID.w, *ptr=0)
  Prototype GdipDeleteStringFormat(hFormat)
  Prototype GdipMeasureString(hGraphics, sFileName.p-unicode, minusone, hFont, *frect, hFormat, *ffrect, *int1, *int2)
  Prototype GdipSetInterpolationMode(hGraphics, mode)
  Prototype GdipSetTextRenderingHint(hGraphics, mode)
  Prototype GdipDisposeImage(hImage)
  Prototype GdipDeletePen(hPen)
  Prototype Direct3DCreate9(nVersion)
  Prototype D3DXGetImageInfoFromFileW(sFileName.p-unicode, *ptr=0)
  Prototype D3DXGetImageInfoFromFileInMemory(pSrcData, SrcDataSize, *ptr=0)
  Prototype D3DXCreateTextureFromFileExW(pDevice, sFileName.p-unicode, Width, Height, MipLevels, Usage, Format, Pool, Filter, MipFilter, ColorKey, *pSrcInfo, *pPalette, *ppTexture)
  Prototype D3DXCreateTextureFromFileInMemoryEx(pDevice, pSrcData, SrcDataSize, Width, Height, MipLevels, Usage, Format, Pool, Filter, MipFilter, ColorKey, *pSrcInfo, *pPalette, *ppTexture)
  Prototype D3DXCreateSprite(pDevice, *ppSprite)
  Prototype D3DXCreateFontW(pDevice, Height, Width, Weight, MipLevels, Italic, CharSet, OutputPrecision, Quality, PitchAndFamily, sFileName.p-unicode, *ppFont)
  Prototype D3DXCreateLine(pDevice, *ppLine)
  Prototype GdipFillEllipse(hGraphics, hBrush, x.f, y.f, w.f, h.f)
  Prototype GdipGetImageHeight(hImage, *ptr=0)
  Prototype GdipGetImageWidth(hImage, *ptr=0)
  Prototype GdipSetClipRect(hGraphics, x.f, y.f, w.f, h.f, combineMode )
  Prototype GdipSetClipRegion(hGraphics, region, combineMode )
  Prototype GdipResetClip(hGraphics)
  Prototype AddFontMemResourceEx(pbFont.l, cbFont.l, pdv.l, *pcFonts)
  Prototype GdipImageRotateFlip(hImage, iRotateFlipType)
  Prototype GdipSetPenWidth(hPen, Width.f)
;
  ;}----------------------------------------------------------
  ;-       Device -> Globals -> Prototype
  ;{----------------------------------------------------------
  Global GdiplusStartup.GdiplusStartup, GdipCreateFromHWND.GdipCreateFromHWND, GdipSetLineLinearBlend.GdipSetLineLinearBlend, GdipFillRectangleI.GdipFillRectangleI, GdipSetPenWidth.GdipSetPenWidth
  Global GdipCreateLineBrush.GdipCreateLineBrush, GdipDeleteBrush.GdipDeleteBrush, GdipDeleteGraphics.GdipDeleteGraphics, GdiplusShutdown.GdiplusShutdown, GdipFillPieI.GdipFillPieI
  Global GdipCreateSolidFill.GdipCreateSolidFill, GdipGraphicsClear.GdipGraphicsClear, GdipCreateFontFamilyFromName.GdipCreateFontFamilyFromName, GdipCreateFont.GdipCreateFont
  Global GdipDrawString.GdipDrawString, GdipDeleteFontFamily.GdipDeleteFontFamily, GdipDeleteFont.GdipDeleteFont, GdipSetSmoothingMode.GdipSetSmoothingMode, GdipDrawRectangle.GdipDrawRectangle
  Global GdipCreateTexture.GdipCreateTexture, GdipLoadImageFromFileICM.GdipLoadImageFromFileICM, GdipCreateBitmapFromHBITMAP.GdipCreateBitmapFromHBITMAP, GdipCreateBitmapFromGraphics.GdipCreateBitmapFromGraphics
  Global GdipGetImageGraphicsContext.GdipGetImageGraphicsContext, GdipDrawImageI.GdipDrawImageI, GdipCreateFromHDC.GdipCreateFromHDC, GdipCreateHBITMAPFromBitmap.GdipCreateHBITMAPFromBitmap, GdipGetDC.GdipGetDC
  Global GdipCreatePen1.GdipCreatePen1, GdipCreatePen2.GdipCreatePen2, GdipSetPenColor.GdipSetPenColor, GdipSetSolidFillColor.GdipSetSolidFillColor, GdipDrawArc.GdipDrawArc
  Global GdipDrawBezier.GdipDrawBezier, GdipDrawEllipse.GdipDrawEllipse, GdipDrawImage.GdipDrawImage, GdipDrawImageRect.GdipDrawImageRect, GdipDrawLine.GdipDrawLine, GdipLoadImageFromFile.GdipLoadImageFromFile
  Global GdipLoadImageFromStream.GdipLoadImageFromStream, GdipDrawPie.GdipDrawPie, GdipCreateStringFormat.GdipCreateStringFormat, GdipDeleteStringFormat.GdipDeleteStringFormat, GdipMeasureString.GdipMeasureString
  Global GdipSetInterpolationMode.GdipSetInterpolationMode, GdipSetTextRenderingHint.GdipSetTextRenderingHint, GdipDisposeImage.GdipDisposeImage, GdipDeletePen.GdipDeletePen, Direct3DCreate9.Direct3DCreate9
  Global D3DXGetImageInfoFromFileW.D3DXGetImageInfoFromFileW, D3DXGetImageInfoFromFileInMemory.D3DXGetImageInfoFromFileInMemory, D3DXCreateTextureFromFileExW.D3DXCreateTextureFromFileExW, GdipImageRotateFlip.GdipImageRotateFlip
  Global D3DXCreateTextureFromFileInMemoryEx.D3DXCreateTextureFromFileInMemoryEx, D3DXCreateSprite.D3DXCreateSprite, D3DXCreateFontW.D3DXCreateFontW, D3DXCreateLine.D3DXCreateLine, GdipResetClip.GdipResetClip
  Global GdipFillEllipse.GdipFillEllipse, GdipGetImageHeight.GdipGetImageHeight, GdipGetImageWidth.GdipGetImageWidth, GdipSetClipRect.GdipSetClipRect, GdipSetClipRegion.GdipSetClipRegion, AddFontMemResourceEx.AddFontMemResourceEx
  ;}----------------------------------------------------------
  ;-       Device -> Var
  ;{----------------------------------------------------------
  Global LibD3D9.l, LibD3D9_43.l, LibGDIPlus.l, LibGDI32.l
  Global GDIPSTARTUPINPUT.GDIPSTARTUPINPUT, ULONG_PTR.ULONG_PTR
  ;}----------------------------------------------------------
  ;-       Device -> PureBasic
  ;{----------------------------------------------------------
  
  ;}----------------------------------------------------------
  ;-       Device -> Procedure's
  ;{----------------------------------------------------------
  
  Procedure.l LoadLibrary(name.s, pLib.l)
    If PeekL(pLib) <> 0
      ProcedureReturn 0
    EndIf
    Define Lib = OpenLibrary(#PB_Any, name)
    If Lib <> 0
      PokeL(pLib, Lib)
      ProcedureReturn 1
    EndIf
    ProcedureReturn 0
  EndProcedure
  
  Procedure.l CloseLibraryA(pLib.l)
    If pLib <> 0
      CloseLibrary(PeekL(pLib))
      PokeL(pLib, 0)
      ProcedureReturn 1
    EndIf
    ProcedureReturn 0
  EndProcedure
  
  Procedure.l StyleDecodeA(*hDevice.Device, *x, *y, *w, *h, *style)
    Define d_style = PeekL(*style)
    If d_style > 0
      If d_style & #STYLE_FULL
        PokeL(*w, *hDevice\INFO\RECT\right)
        PokeL(*h, *hDevice\INFO\RECT\bottom)
      EndIf
      If d_style & #STYLE_WIDTH_MAX
        PokeL(*w, *hDevice\INFO\RECT\right - PeekL(*x) - PeekL(*w))
      EndIf
      If d_style & #STYLE_HEIGHT_MAX
        PokeL(*h, *hDevice\INFO\RECT\bottom - PeekL(*y) - PeekL(*h))
      EndIf
      If d_style & #STYLE_CENTER_WIDTH
        PokeL(*x, (((*hDevice\INFO\RECT\right - PeekL(*x)) / 2) - (PeekL(*w) / 2)) + PeekL(*x))
      EndIf
      If d_style & #STYLE_CENTER_HEIGHT
        PokeL(*y, (((*hDevice\INFO\RECT\bottom - PeekL(*y)) / 2) - (PeekL(*h) / 2)) + PeekL(*y))
      EndIf
      If d_style & #STYLE_CENTER
        PokeL(*x, ((*hDevice\INFO\RECT\right / 2) - (PeekL(*w) / 2)) + PeekL(*x))
        PokeL(*y, ((*hDevice\INFO\RECT\bottom / 2) - (PeekL(*h) / 2)) + PeekL(*y))
      EndIf
      If d_style & #STYLE_RIGHT
        PokeL(*x, *hDevice\INFO\RECT\right - (PeekL(*x) + PeekL(*w)))
      EndIf
      If d_style & #STYLE_BOTTOM
        PokeL(*y, *hDevice\INFO\RECT\bottom - (PeekL(*y) + PeekL(*h)))
      EndIf
    EndIf
  EndProcedure
  
  Procedure.l StyleDecodeB(*hDevice.Device, style.l)
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI
        
      Case #DEVICE_D3D9
        If style & #STYLE_QUALTY_NONE : ProcedureReturn 3 : EndIf
        If style & #STYLE_QUALTY_SMALL : ProcedureReturn 1 : EndIf
        If style & #STYLE_QUALTY_NORM : ProcedureReturn 6 : EndIf
        If style & #STYLE_QUALTY_FULL : ProcedureReturn 10 : EndIf
    EndSelect
    ProcedureReturn 0
  EndProcedure
  
  Procedure.l VideoDriver()
    Protected size, vidkey, firstvid$, device$, device2$
    If RegOpenKeyEx_ (#HKEY_LOCAL_MACHINE, "HARDWARE\DEVICEMAP\VIDEO", 0, #KEY_READ, @vidkey) = #ERROR_SUCCESS
      If  RegQueryValueEx_ (vidkey, "\Device\Video0", #Null, #Null, #Null, @size) = #ERROR_SUCCESS
        firstvid$ = Space (size)
        If RegQueryValueEx_ (vidkey, "\Device\Video0", #Null, #Null, @firstvid$, @size) = #ERROR_SUCCESS
          If LCase (Left (firstvid$, 18)) = "\registry\machine\"
            firstdev$ = Right (firstvid$, Len (firstvid$) - 18)
          EndIf
          If RegOpenKeyEx_ (#HKEY_LOCAL_MACHINE, firstdev$, 0, #KEY_READ, @devkey) = #ERROR_SUCCESS
            If  RegQueryValueEx_ (devkey, "Device Description", #Null, #Null, #Null, @size) = #ERROR_SUCCESS
              device$ = Space (size)
              RegQueryValueEx_ (devkey, "Device Description", #Null, #Null, @device$, @size)
            EndIf
            RegCloseKey_ (devkey)
          EndIf
        EndIf
      EndIf
      RegCloseKey_ (vidkey)
    EndIf
    device$ = Trim(device$)
    If device$ = ""
      ProcedureReturn #DEVICE_GDI ; Basic
    EndIf
    ProcedureReturn #DEVICE_D3D9
  EndProcedure
  
  Procedure.l IsDraw(*hDevice.Device, x, y, w, h)
    If Not *hDevice : ProcedureReturn 0 : EndIf
    If x < 0 And x > w : ProcedureReturn 1 : EndIf
    If y < 0 And y > h : ProcedureReturn 1 : EndIf
    If x > *hDevice\INFO\RECT\right : If (x+w) > *hDevice\INFO\RECT\right : ProcedureReturn 1 : EndIf : EndIf
    If y > *hDevice\INFO\RECT\bottom : If (y+h) > *hDevice\INFO\RECT\bottom : ProcedureReturn 1 : EndIf : EndIf
    ProcedureReturn 0
  EndProcedure
  
  Procedure tThread(*hDevice.Device)
    EnableDebugger
    Protected handle.l = *hDevice\INFO\hWnd, event.l, hclose.l, TBL.ITaskbarList, OnActive.l = 1
    Protected RECT.RECT, Point.Point, tRECT.RECT, tPoint.Point
    GetClientRect_(handle, @RECT)
    Point\x = 0 
    Point\y = 0 
    ClientToScreen_(handle, @Point)
    CopyMemory(@RECT, @tRECT, SizeOf(RECT))
    CopyMemory(@Point, @tPoint, SizeOf(POINT))
    If RECT\right <= 0
      RECT\right = 10
    EndIf
    If RECT\bottom <= 0
      RECT\bottom = 10
    EndIf
    DisableDebugger
    *hDevice\INFO\THREAD\WinID = OpenWindow(#PB_Any, Point\x, Point\y, RECT\right, RECT\bottom, "", #PB_Window_BorderLess)
    *hDevice\INFO\THREAD\WinHandle = WindowID(*hDevice\INFO\THREAD\WinID)
    
    CoInitialize_( 0 )
    If CoCreateInstance_(?CLSID_TaskBarList, 0, 1, ?IID_ITaskBarList, @TBL) = #S_OK 
      TBL\HrInit() 
      TBL\DeleteTab(*hDevice\INFO\THREAD\WinHandle) 
      TBL\Release() 
    EndIf 
    CoUninitialize_() 
    
    DataSection 
      CLSID_TaskBarList: 
      Data.l $56FDF344 
      Data.w $FD6D, $11D0 
      Data.b $95, $8A, $00, $60, $97, $C9, $A0, $90 
      IID_ITaskBarList: 
      Data.l $56FDF342 
      Data.w $FD6D, $11D0 
      Data.b $95, $8A, $00, $60, $97, $C9, $A0, $90 
    EndDataSection 
    
    StickyWindow(*hDevice\INFO\THREAD\WinID, 1)
    SetWindowLongPtr_(*hDevice\INFO\THREAD\WinHandle, #GWL_EXSTYLE, GetWindowLongPtr_(*hDevice\INFO\THREAD\WinHandle, #GWL_EXSTYLE) | #WS_EX_LAYERED | #WS_EX_TRANSPARENT)
    *hDevice\INFO\hWnd = *hDevice\INFO\THREAD\WinHandle
    Repeat
      DisableDebugger
      event = WindowEvent() ; Обработка окна
      EnableDebugger
      If *hDevice\INFO\THREAD\close = 2
        ;//*hDevice\INFO\THREAD\close = 0
        Break
      EndIf
      Delay(1)
    ForEver
    EnableDebugger
    Repeat
      DisableDebugger
      event = WindowEvent() ; Обработка окна
      EnableDebugger
      If IsWindow_(handle)
        GetClientRect_(handle, @RECT)
        Point\x = 0 
        Point\y = 0 
        ClientToScreen_(handle, @Point)
        If GetForegroundWindow_() = handle Or GetForegroundWindow_() = 0
          If OnActive = 0
            DisableDebugger
            StickyWindow(*hDevice\INFO\THREAD\WinID, 1)
            EnableDebugger
            OnActive = 1
          EndIf
        ElseIf OnActive = 1
          DisableDebugger
          StickyWindow(*hDevice\INFO\THREAD\WinID, 0)
          EnableDebugger
          OnActive = 0
        EndIf
        If CompareMemory(@Point, @tPoint, SizeOf(POINT)) = 0 Or CompareMemory(@RECT, @tRECT, SizeOf(RECT)) = 0
          If Point\x < -5000 And Point\y < -5000
            DisableDebugger
            HideWindow(*hDevice\INFO\THREAD\WinID, #True)
            EnableDebugger
            *hDevice\INFO\OnMinimize = 1
          Else
            If *hDevice\INFO\OnMinimize = 1
              DisableDebugger
              HideWindow(*hDevice\INFO\THREAD\WinID, #False, #PB_Window_NoActivate)
              StickyWindow(*hDevice\INFO\THREAD\WinID, 1)
              EnableDebugger
              ;// Clear --
              Clear(*hDevice, $00000000)
              Draw(*hDevice)
              *hDevice\INFO\OnMinimize = 0
            EndIf
            DisableDebugger
            ResizeWindow(*hDevice\INFO\THREAD\WinID, Point\x, Point\y, RECT\right, RECT\bottom)
            EnableDebugger
            If CompareMemory(@RECT, @tRECT, SizeOf(RECT)) = 0
              Close(*hDevice, 1)
              *hDevice = Create(handle, #DEVICE_GDI, 1, 32, 30, 1, *hDevice)
              Clear(*hDevice, $00000000)
              Draw(*hDevice)
            EndIf
          EndIf
          CopyMemory(@RECT, @tRECT, SizeOf(RECT))
          CopyMemory(@Point, @tPoint, SizeOf(POINT))
        EndIf
      ElseIf hclose = 0
        hclose = 1
        DisableDebugger
        HideWindow(*hDevice\INFO\THREAD\WinID, #True)
        EnableDebugger
        *hDevice\INFO\OnMinimize = 1
      EndIf
      
      If *hDevice\INFO\THREAD\close = 1
        DisableDebugger
        CloseWindow(*hDevice\INFO\THREAD\WinID)
        DisableDebugger
        Break
      EndIf
      Delay(1)
    ForEver
    *hDevice\INFO\THREAD\close = 0
  EndProcedure
  
  ;}----------------------------------------------------------
  ;-       Device -> Function
  ;{----------------------------------------------------------
  
  Procedure.l GdiplusStartup_()
    If GDIPSTARTUPINPUT\Version = 0
      GDIPSTARTUPINPUT\Version = 1
      GdiplusStartup(@ULONG_PTR, @GDIPSTARTUPINPUT, 0)
    EndIf
  EndProcedure
  
  Procedure.l PrototypeInit()
    If LibGDIPlus
      GdiplusStartup.GdiplusStartup = GetFunction(LibGDIPlus, "GdiplusStartup")
      GdipCreateFromHWND.GdipCreateFromHWND = GetFunction(LibGDIPlus, "GdipCreateFromHWND")
      GdipSetLineLinearBlend.GdipSetLineLinearBlend = GetFunction(LibGDIPlus, "GdipSetLineLinearBlend")
      GdipFillRectangleI.GdipFillRectangleI = GetFunction(LibGDIPlus, "GdipFillRectangleI")
      GdipCreateLineBrush.GdipCreateLineBrush = GetFunction(LibGDIPlus,"GdipCreateLineBrush")
      GdipDeleteBrush.GdipDeleteBrush = GetFunction(LibGDIPlus, "GdipDeleteBrush")
      GdipDeleteGraphics.GdipDeleteGraphics = GetFunction(LibGDIPlus, "GdipDeleteGraphics")
      GdiplusShutdown.GdiplusShutdown = GetFunction(LibGDIPlus, "GdiplusShutdown")
      GdipFillPieI.GdipFillPieI = GetFunction(LibGDIPlus, "GdipFillPieI")
      GdipCreateSolidFill.GdipCreateSolidFill = GetFunction(LibGDIPlus, "GdipCreateSolidFill")
      GdipGraphicsClear.GdipGraphicsClear = GetFunction(LibGDIPlus, "GdipGraphicsClear")
      GdipCreateFontFamilyFromName.GdipCreateFontFamilyFromName = GetFunction(LibGDIPlus, "GdipCreateFontFamilyFromName")
      GdipCreateFont.GdipCreateFont = GetFunction(LibGDIPlus,"GdipCreateFont")
      GdipDrawString.GdipDrawString = GetFunction(LibGDIPlus,"GdipDrawString")
      GdipDeleteFontFamily.GdipDeleteFontFamily = GetFunction(LibGDIPlus,"GdipDeleteFontFamily")
      GdipDeleteFont.GdipDeleteFont = GetFunction(LibGDIPlus, "GdipDeleteFont")
      GdipSetSmoothingMode.GdipSetSmoothingMode = GetFunction(LibGDIPlus, "GdipSetSmoothingMode")
      GdipCreateTexture.GdipCreateTexture = GetFunction(LibGDIPlus, "GdipCreateTexture")
      GdipLoadImageFromFileICM.GdipLoadImageFromFileICM = GetFunction(LibGDIPlus, "GdipLoadImageFromFileICM")
      GdipCreateBitmapFromHBITMAP.GdipCreateBitmapFromHBITMAP = GetFunction(LibGDIPlus, "GdipCreateBitmapFromHBITMAP")
      GdipCreateBitmapFromGraphics.GdipCreateBitmapFromGraphics = GetFunction(LibGDIPlus, "GdipCreateBitmapFromGraphics")
      GdipGetImageGraphicsContext.GdipGetImageGraphicsContext = GetFunction(LibGDIPlus, "GdipGetImageGraphicsContext")
      GdipDrawImageI.GdipDrawImageI = GetFunction(LibGDIPlus, "GdipDrawImageI")
      GdipCreateFromHDC.GdipCreateFromHDC = GetFunction(LibGDIPlus, "GdipCreateFromHDC")
      GdipCreateHBITMAPFromBitmap.GdipCreateHBITMAPFromBitmap = GetFunction(LibGDIPlus, "GdipCreateHBITMAPFromBitmap")
      GdipGetDC.GdipGetDC = GetFunction(LibGDIPlus, "GdipGetDC")
      GdipDrawRectangle.GdipDrawRectangle = GetFunction(LibGDIPlus, "GdipDrawRectangle")
      GdipCreatePen2.GdipCreatePen2 = GetFunction(LibGDIPlus, "GdipCreatePen2")
      GdipCreatePen1.GdipCreatePen1 = GetFunction(LibGDIPlus, "GdipCreatePen1")
      GdipSetPenColor.GdipSetPenColor = GetFunction(LibGDIPlus, "GdipSetPenColor")
      GdipSetSolidFillColor.GdipSetSolidFillColor = GetFunction(LibGDIPlus, "GdipSetSolidFillColor")
      GdipDrawArc.GdipDrawArc = GetFunction(LibGDIPlus, "GdipDrawArc")
      GdipDrawBezier.GdipDrawBezier = GetFunction(LibGDIPlus, "GdipDrawBezier")
      GdipDrawEllipse.GdipDrawEllipse = GetFunction(LibGDIPlus, "GdipDrawEllipse")
      GdipDrawImage.GdipDrawImage = GetFunction(LibGDIPlus, "GdipDrawImage")
      GdipDrawImageRect.GdipDrawImageRect = GetFunction(LibGDIPlus, "GdipDrawImageRect")
      GdipDrawLine.GdipDrawLine = GetFunction(LibGDIPlus, "GdipDrawLine")
      GdipLoadImageFromFile.GdipLoadImageFromFile = GetFunction(LibGDIPlus, "GdipLoadImageFromFile")
      GdipLoadImageFromStream.GdipLoadImageFromStream = GetFunction(LibGDIPlus, "GdipLoadImageFromStream")
      GdipDrawPie.GdipDrawPie = GetFunction(LibGDIPlus, "GdipDrawPie")
      GdipCreateStringFormat.GdipCreateStringFormat = GetFunction(LibGDIPlus, "GdipCreateStringFormat")
      GdipDeleteStringFormat.GdipDeleteStringFormat = GetFunction(LibGDIPlus, "GdipDeleteStringFormat")
      GdipMeasureString.GdipMeasureString = GetFunction(LibGDIPlus, "GdipMeasureString")
      GdipSetInterpolationMode.GdipSetInterpolationMode = GetFunction(LibGDIPlus, "GdipSetInterpolationMode")
      GdipSetTextRenderingHint.GdipSetTextRenderingHint = GetFunction(LibGDIPlus, "GdipSetTextRenderingHint")
      GdipDisposeImage.GdipDisposeImage = GetFunction(LibGDIPlus, "GdipDisposeImage")
      GdipDeletePen.GdipDeletePen = GetFunction(LibGDIPlus, "GdipDeletePen")
      GdipFillEllipse.GdipFillEllipse = GetFunction(LibGDIPlus, "GdipFillEllipse")
      GdipGetImageHeight.GdipGetImageHeight = GetFunction(LibGDIPlus, "GdipGetImageHeight")
      GdipGetImageWidth.GdipGetImageWidth = GetFunction(LibGDIPlus, "GdipGetImageWidth")
      GdipSetClipRegion.GdipSetClipRegion = GetFunction(LibGDIPlus, "GdipSetClipRegion")
      GdipSetClipRect.GdipSetClipRect = GetFunction(LibGDIPlus, "GdipSetClipRect")
      GdipResetClip.GdipResetClip = GetFunction(LibGDIPlus, "GdipResetClip")
      GdipImageRotateFlip.GdipImageRotateFlip = GetFunction(LibGDIPlus, "GdipImageRotateFlip")
      GdipSetPenWidth.GdipSetPenWidth = GetFunction(LibGDIPlus, "GdipSetPenWidth")
    EndIf
    If LibGDI32
      AddFontMemResourceEx.AddFontMemResourceEx = GetFunction(LibGDI32, "AddFontMemResourceEx")
    EndIf
    If LibD3D9_43
      D3DXGetImageInfoFromFileW.D3DXGetImageInfoFromFileW = GetFunction(LibD3D9_43, "D3DXGetImageInfoFromFileW")
      D3DXGetImageInfoFromFileInMemory.D3DXGetImageInfoFromFileInMemory = GetFunction(LibD3D9_43, "D3DXGetImageInfoFromFileInMemory")
      D3DXCreateTextureFromFileExW.D3DXCreateTextureFromFileExW = GetFunction(LibD3D9_43, "D3DXCreateTextureFromFileExW")
      D3DXCreateTextureFromFileInMemoryEx.D3DXCreateTextureFromFileInMemoryEx = GetFunction(LibD3D9_43, "D3DXCreateTextureFromFileInMemoryEx")
      D3DXCreateSprite.D3DXCreateSprite = GetFunction(LibD3D9_43, "D3DXCreateSprite")
      D3DXCreateFontW.D3DXCreateFontW = GetFunction(LibD3D9_43, "D3DXCreateFontW")
      D3DXCreateLine.D3DXCreateLine = GetFunction(LibD3D9_43, "D3DXCreateLine")
    EndIf
    If LibD3D9
      Direct3DCreate9.Direct3DCreate9 = GetFunction(LibD3D9, "Direct3DCreate9")
    EndIf
  EndProcedure
  
  Procedure.l Init()
    LoadLibrary("gdi32.dll", @LibGDI32)
    LoadLibrary("gdiplus.dll", @LibGDIPlus)
    LoadLibrary("d3d9.dll", @LibD3D9)
    LoadLibrary("d3dx9_43.dll", @LibD3D9_43)
    PrototypeInit()
    GdiplusStartup_()
  EndProcedure
  
  Procedure.l Release()
    CloseLibraryA(@LibGDIPlus)
    CloseLibraryA(@LibD3D9)
    CloseLibraryA(@LibD3D9_43)
    CloseLibraryA(@LibD3D11)
    CloseLibraryA(@LibD3D11_43)
  EndProcedure
  
  Procedure.l Create(hWnd.l, device.l = #DEVICE_GDI, begun.l = 1, AlphaFormat.l = 32, fps.l = 30, layred.l = 0, *hDevice.Device = 0)
    Protected OnNew.l = 0, DCP.l
    Debug 14
    If device = #DEVICE_AUTO
      device = VideoDriver()
    EndIf
    If *hDevice = 0
      *hDevice.Device = AllocateMemory(SizeOf(Device))
      If device = #DEVICE_OVERLAY
        DCP = 1
        device = #DEVICE_GDI
        layred = 1
        *hDevice\INFO\hWnd = hWnd
        *hDevice\INFO\THREAD\ThreadID = CreateThread(@tThread(), *hDevice)
        Repeat
          Delay(1)
          If *hDevice\INFO\hWnd <> hWnd
            Break
          EndIf
        ForEver
      Else
        *hDevice\INFO\hWnd = hWnd
      EndIf
      *hDevice\INFO\Device = device
      *hDevice\INFO\AlphaBlend = AlphaFormat
      *hDevice\INFO\LAYERED = layred
      *hDevice\INFO\FPS\count = fps
      *hDevice\INFO\FPS\tick = ((1000 / fps) - 1)
      *hDevice\INFO\FPS\time = GetTickCount_()
      *hDevice\INFO\DeviceOrig = device
      *hDevice\INFO\OnRelease = 1
      
      If *hDevice\INFO\LAYERED = 1
        SetWindowLongPtr_(*hDevice\INFO\hWnd, #GWL_EXSTYLE, GetWindowLongPtr_(*hDevice\INFO\hWnd, #GWL_EXSTYLE) | #WS_EX_LAYERED)
      EndIf
      
      OnNew = 1
    EndIf    
    
    GetClientRect_(*hDevice\INFO\hWnd, @*hDevice\INFO\RECT)
    
    If *hDevice\INFO\RECT\right <= 0 Or *hDevice\INFO\RECT\bottom <= 0
      ProcedureReturn *hDevice
    EndIf
    
    
    
    Select *hDevice\INFO\Device
      ;-----------------------------------------------------------
      ;-       Device -> #DEVICE_GDI
      ;{----------------------------------------------------------
      Case #DEVICE_GDI
        *hDevice\GDI\BLENDFUNCTION\SourceConstantAlpha = $FF
        If *hDevice\INFO\AlphaBlend = 32 : *hDevice\GDI\BLENDFUNCTION\AlphaFormat = 1 : EndIf
        *hDevice\GDI\hImage = CreateBitmap_(*hDevice\INFO\RECT\right, *hDevice\INFO\RECT\bottom, 1, AlphaFormat, 0)
        If *hDevice\GDI\hImage
          *hDevice\GDI\hDC = GetDC_(*hDevice\INFO\hWnd)
          If *hDevice\GDI\hDC
            *hDevice\GDI\hHDC = CreateCompatibleDC_(*hDevice\GDI\hDC)
            If *hDevice\GDI\hHDC
              *hDevice\GDI\hsObj = SelectObject_(*hDevice\GDI\hHDC, *hDevice\GDI\hImage)
              If *hDevice\GDI\hsObj
                If GetObject_(*hDevice\GDI\hImage, SizeOf(BITMAP), @*hDevice\GDI\BITMAP)
                  *hDevice\GDI\size\cx = *hDevice\GDI\BITMAP\bmWidth
                  *hDevice\GDI\size\cy = *hDevice\GDI\BITMAP\bmHeight
                  GdipCreateFromHDC(*hDevice\GDI\hHDC, @*hDevice\GDI\hContext)
                  If *hDevice\GDI\hContext
                    GdipCreateSolidFill($FFFF0000, @*hDevice\GDI\hBrush)
                    If *hDevice\GDI\hBrush
                      GdipCreatePen1($FFFF0000, 1, 2, @*hDevice\GDI\hPen)
                    EndIf
                    If *hDevice\GDI\BLENDFUNCTION\AlphaFormat = 1 ; Alpha Blend
                      GdipSetSmoothingMode(*hDevice\GDI\hContext, 2)
                      GdipSetInterpolationMode(*hDevice\GDI\hContext, 7)
                      GdipSetTextRenderingHint(*hDevice\GDI\hContext, 4)
                      GdipGraphicsClear(*hDevice\GDI\hContext,$00000000)
                    EndIf
                  EndIf
                EndIf
              EndIf
            EndIf
          EndIf
        EndIf
        If OnNew = 1
          Draw(*hDevice)
        EndIf
      ;}----------------------------------------------------------
      ;-       Device -> #DEVICE_D3D9
      ;{----------------------------------------------------------
      Case #DEVICE_D3D9
        *hDevice\GDI\BLENDFUNCTION\SourceConstantAlpha = $FF
        If *hDevice\INFO\AlphaBlend = 32 : *hDevice\GDI\BLENDFUNCTION\AlphaFormat = 1 : EndIf
        *hDevice\GDI\size\cx = *hDevice\INFO\RECT\right
        *hDevice\GDI\size\cy = *hDevice\INFO\RECT\bottom
        *hDevice\D3D9\pD3D = Direct3DCreate9(#D3D_SDK_VERSION)
        If *hDevice\D3D9\pD3D
          *hDevice\GDI\hDC = GetDC_(*hDevice\INFO\hWnd)
          *hDevice\D3D9\d3dpp\Windowed = #True
          *hDevice\D3D9\d3dpp\SwapEffect = #D3DSWAPEFFECT_DISCARD
          *hDevice\D3D9\d3dpp\BackBufferFormat = #D3DFMT_UNKNOWN
          *hDevice\D3D9\d3dpp\BackBufferWidth = 0
          *hDevice\D3D9\d3dpp\BackBufferHeight = 0
          *hDevice\D3D9\pD3D\CreateDevice(#D3DADAPTER_DEFAULT, #D3DDEVTYPE_HAL, *hDevice\INFO\hWnd, #D3DCREATE_SOFTWARE_VERTEXPROCESSING, *hDevice\D3D9\d3dpp, @*hDevice\D3D9\pd3dDevice)
          If *hDevice\D3D9\pd3dDevice
            *hDevice\D3D9\pd3dDevice\CreateVertexBuffer(4 * SizeOf(D3DTLVERTEX), 0, #D3DFVF_CUSTOMVERTEX, #D3DPOOL_DEFAULT, @*hDevice\D3D9\pVB, 0)
            If *hDevice\D3D9\pVB
              D3DXCreateLine(*hDevice\D3D9\pd3dDevice, @*hDevice\D3D9\d3dline)
              If *hDevice\D3D9\d3dline
                *hDevice\D3D9\d3dline\SetWidth(1)
                *hDevice\D3D9\d3dline\SetAntialias(#True)
                *hDevice\D3D9\d3dline\SetGLLines(#True)
              EndIf
            EndIf
            *hDevice\D3D9\pd3dDevice\CreateOffscreenPlainSurface(*hDevice\INFO\RECT\right, *hDevice\INFO\RECT\bottom, 21, 3, @*hDevice\D3D9\pBackBuffer, 0)
            *hDevice\D3D9\pd3dDevice\GetBackBuffer(0,0,0,@*hDevice\D3D9\pBackBuffer)
            If *hDevice\D3D9\pBackBuffer
              *hDevice\D3D9\pBackBuffer\GetDC(@*hDevice\D3D9\pBackDC)
            EndIf
            *hDevice\D3D9\pd3dDevice\BeginScene()
            If *hDevice\INFO\AlphaBlend = 32
              *hDevice\D3D9\pd3dDevice\SetRenderState(#D3DRS_ALPHABLENDENABLE, #True)
              *hDevice\D3D9\pd3dDevice\SetRenderState(#D3DRS_SRCBLEND, #D3DBLEND_SRCALPHA);
              *hDevice\D3D9\pd3dDevice\SetRenderState(#D3DRS_DESTBLEND, #D3DBLEND_INVSRCALPHA)
             EndIf
            *hDevice\D3D9\pd3dDevice\SetFVF(#D3DFVF_CUSTOMVERTEX)
          EndIf
        EndIf
      ;}----------------------------------------------------------
      ;-       Device -> #DEVICE_DC
      ;{----------------------------------------------------------
      Case #DEVICE_DC
        *hDevice\GDI\hDC = GetDC_(*hDevice\INFO\hWnd)
        If *hDevice\GDI\hDC
          GdipCreateFromHDC(*hDevice\GDI\hDC, @*hDevice\GDI\hContext)
          If *hDevice\GDI\hContext
            GdipCreateSolidFill($FFFF0000, @*hDevice\GDI\hBrush)
            If *hDevice\GDI\hBrush
              GdipCreatePen1($FFFF0000, 1, 2, @*hDevice\GDI\hPen)
            EndIf
            If *hDevice\GDI\BLENDFUNCTION\AlphaFormat = 1 ; Alpha Blend
              GdipSetSmoothingMode(*hDevice\GDI\hContext, 2)
              GdipSetInterpolationMode(*hDevice\GDI\hContext, 7)
              GdipSetTextRenderingHint(*hDevice\GDI\hContext, 4)
              GdipGraphicsClear(*hDevice\GDI\hContext,$00000000)
            EndIf
          EndIf
        EndIf
      ;}
    EndSelect
    
    If DCP
      Clear(*hDevice, $00000000)
      Draw(*hDevice)
      *hDevice\INFO\THREAD\close = 2
    EndIf
    
    ProcedureReturn *hDevice
  EndProcedure
  
  Procedure.l Close(*hDevice.Device, nFree.l = 0)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI
        If *hDevice\GDI\hContext
          GdipDeleteGraphics(*hDevice\GDI\hContext)
          *hDevice\GDI\hContext = 0
        EndIf
        If *hDevice\GDI\hPen
          GdipDeletePen(*hDevice\GDI\hPen)
          *hDevice\GDI\hPen = 0
        EndIf
        If *hDevice\GDI\hBrush
          GdipDeleteBrush(*hDevice\GDI\hBrush)
          *hDevice\GDI\hBrush = 0
        EndIf
        If *hDevice\GDI\hHDC
          DeleteDC_(*hDevice\GDI\hHDC)
          *hDevice\GDI\hHDC = 0
        EndIf
        If *hDevice\GDI\hDC
          ReleaseDC_(*hDevice\INFO\hWnd, *hDevice\GDI\hDC)
          *hDevice\GDI\hDC = 0
        EndIf
        If *hDevice\GDI\hImage
          DeleteObject_(*hDevice\GDI\hImage)
          *hDevice\GDI\hImage = 0
        EndIf
      Case #DEVICE_DC
        If *hDevice\GDI\hContext
          GdipDeleteGraphics(*hDevice\GDI\hContext)
          *hDevice\GDI\hContext = 0
        EndIf
        If *hDevice\GDI\hPen
          GdipDeletePen(*hDevice\GDI\hPen)
          *hDevice\GDI\hPen = 0
        EndIf
        If *hDevice\GDI\hBrush
          GdipDeleteBrush(*hDevice\GDI\hBrush)
          *hDevice\GDI\hBrush = 0
        EndIf
        If *hDevice\GDI\hDC
          ReleaseDC_(*hDevice\INFO\hWnd, *hDevice\GDI\hDC)
          *hDevice\GDI\hDC = 0
        EndIf
      Case #DEVICE_D3D9
        If *hDevice\D3D9\pBackBuffer
          *hDevice\D3D9\pBackBuffer\ReleaseDC(*hDevice\D3D9\pBackDC)
          *hDevice\D3D9\pBackBuffer\Release()
          *hDevice\D3D9\pBackBuffer = 0
        EndIf
        If *hDevice\D3D9\pVB
          *hDevice\D3D9\pVB\Release()
          *hDevice\D3D9\pVB = 0
        EndIf
        If *hDevice\D3D9\d3dline
          *hDevice\D3D9\d3dline\Release()
          *hDevice\D3D9\d3dline = 0
        EndIf
        If *hDevice\D3D9\pd3dDevice
          *hDevice\D3D9\pd3dDevice\Release()
          *hDevice\D3D9\pd3dDevice = 0
        EndIf
        If *hDevice\D3D9\pD3D
          *hDevice\D3D9\pD3D\Release()
          *hDevice\D3D9\pD3D = 0
        EndIf
        If *hDevice\GDI\hDC
          ReleaseDC_(*hDevice\INFO\hWnd, *hDevice\GDI\hDC)
          *hDevice\GDI\hDC = 0
        EndIf
    EndSelect
    If nFree = 0
      If *hDevice\INFO\THREAD\WinID <> 0
        *hDevice\INFO\THREAD\close = 1
        Repeat
          Delay(1)
          If *hDevice\INFO\THREAD\close = 0
            Break
          EndIf
        ForEver
        *hDevice\INFO\THREAD\WinID = 0
      EndIf
      FreeMemory(*hDevice)
    EndIf
  EndProcedure
  
  Procedure.l Draw(*hDevice.Device)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    *hDevice\INFO\MOUSE\dr = 0
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI
        If *hDevice\INFO\LAYERED
          UpdateLayeredWindow_(*hDevice\INFO\hWnd, *hDevice\GDI\hDC, 0, @*hDevice\GDI\size, *hDevice\GDI\hHDC, @*hDevice\GDI\Point, 0, @*hDevice\GDI\BLENDFUNCTION, 2)
        Else
          BitBlt_(*hDevice\GDI\hDC, 0, 0, *hDevice\GDI\size\cx, *hDevice\GDI\size\cy, *hDevice\GDI\hHDC, 0, 0, #SRCCOPY)
        EndIf
      Case #DEVICE_D3D9
        If *hDevice\D3D9\pd3dDevice = 0 : *hDevice\INFO\RECT\top = -1 : ProcedureReturn 0 : EndIf
        *hDevice\D3D9\pd3dDevice\EndScene()
        If *hDevice\INFO\LAYERED
          
;            *hDevice\D3D9\pd3dDevice\GetBackBuffer(0,0,0,@*hDevice\D3D9\pBackBuffer)
;              *hDevice\D3D9\pBackBuffer\GetDC(@*hDevice\D3D9\pBackDC)
;            Debug *hDevice\D3D9\pBackDC
          *hDevice\D3D9\pd3dDevice\Present(0, 0, 0, 0)
          UpdateLayeredWindow_(*hDevice\INFO\hWnd, *hDevice\GDI\hDC, 0, @*hDevice\GDI\size, *hDevice\D3D9\pBackDC, @*hDevice\GDI\Point, 0, @*hDevice\GDI\BLENDFUNCTION, 2)
        Else
          If *hDevice\D3D9\pd3dDevice\Present(0, 0, 0, 0) <> 0
            *hDevice\INFO\RECT\top = -1
          EndIf
        EndIf
        *hDevice\D3D9\pd3dDevice\BeginScene()
    EndSelect
  EndProcedure
  
  Procedure.l LoadImageA(*hDevice.Device, sFile.s, *hImage.IMAGE = 0, Width.l = -1, Height.l = -1)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hImage <> 0
      ReleaseImage(*hDevice, *hImage)
    EndIf
    *hImage.IMAGE = AllocateMemory(SizeOf(IMAGE))
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        GdipLoadImageFromFile(sFile, @*hImage\hGDI)
        If *hImage\hGDI
          GdipGetImageHeight(*hImage\hGDI, @*hImage\d3dinfo\Height)
          GdipGetImageWidth(*hImage\hGDI, @*hImage\d3dinfo\Width)
        EndIf
      Case #DEVICE_D3D9
        If *hDevice\D3D9\pd3dDevice = 0 : ProcedureReturn *hImage : EndIf
        D3DXGetImageInfoFromFileW(sFile, @*hImage\d3dinfo)
        If Width > 0 And Height > 0
          *hImage\d3dinfo\Width = Width
          *hImage\d3dinfo\Height = Height
        EndIf
        D3DXCreateTextureFromFileExW(*hDevice\D3D9\pd3dDevice, sFile, *hImage\d3dinfo\Width, *hImage\d3dinfo\Height, *hImage\d3dinfo\MipLevels, #D3DUSAGE_RENDERTARGET, #D3DFMT_UNKNOWN, #D3DPOOL_DEFAULT, #D3DX_DEFAULT, #D3DX_DEFAULT, $00FF00FF, 0, 0, @*hImage\d3dtexture)
        D3DXCreateSprite(*hDevice\D3D9\pd3dDevice, @*hImage\d3dsprite)
    EndSelect
    ProcedureReturn *hImage
  EndProcedure
  
  Procedure.l LoadImageMemory(*hDevice.Device, pMem, bytes.l, *hImage.IMAGE = 0, Width.l = -1, Height.l = -1)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hImage <> 0
      ReleaseImage(*hDevice, *hImage)
    EndIf
    *hImage.IMAGE = AllocateMemory(SizeOf(IMAGE))
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        *hImage\pMem = GlobalAlloc_(#GMEM_FIXED, bytes)
        If *hImage\pMem <> 0
          CopyMemory(pMem, *hImage\pMem, bytes)
          CreateStreamOnHGlobal_(*hImage\pMem, #True, @*hImage\pStream)
          If *hImage\pStream
            GdipLoadImageFromStream(*hImage\pStream, @*hImage\hGDI)
          EndIf
          If *hImage\hGDI
            GdipGetImageHeight(*hImage\hGDI, @*hImage\d3dinfo\Height)
            GdipGetImageWidth(*hImage\hGDI, @*hImage\d3dinfo\Width)
          EndIf
        EndIf
      Case #DEVICE_D3D9
        If *hDevice\D3D9\pd3dDevice = 0 : ProcedureReturn *hImage : EndIf
        D3DXGetImageInfoFromFileInMemory(pMem, bytes, @*hImage\d3dinfo)
        If Width > 0 And Height > 0
          *hImage\d3dinfo\Width = Width
          *hImage\d3dinfo\Height = Height
        EndIf
        D3DXCreateTextureFromFileInMemoryEx(*hDevice\D3D9\pd3dDevice, pMem, bytes, *hImage\d3dinfo\Width, *hImage\d3dinfo\Height, *hImage\d3dinfo\MipLevels, #D3DUSAGE_RENDERTARGET, #D3DFMT_UNKNOWN, #D3DPOOL_DEFAULT, #D3DX_DEFAULT, #D3DX_DEFAULT, $00FF00FF, 0, 0, @*hImage\d3dtexture)
        D3DXCreateSprite(*hDevice\D3D9\pd3dDevice, @*hImage\d3dsprite) 
     EndSelect
    ProcedureReturn *hImage
  EndProcedure
    
  Procedure.l LoadFontA(*hDevice.Device, sName.s, size, style.l=#STYLE_QUALTY_FULL, *hFont.FONT = 0)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hFont <> 0
      ReleaseFont(*hDevice, *hFont)
    EndIf
    *hFont.FONT = AllocateMemory(SizeOf(FONT))
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        GdipCreateFontFamilyFromName(sName, 0, @*hFont\hFamily)
        If *hFont\hFamily
          GdipCreateFont(*hFont\hFamily, size, (style & #STYLE_ITALIC) * 2, 0, @*hFont\hFont)
        EndIf
        GdipCreateStringFormat(0, 0, @*hFont\hFormat)
      Case #DEVICE_D3D9
        If *hDevice\D3D9\pd3dDevice = 0 : ProcedureReturn *hFont : EndIf ; 
        D3DXCreateFontW(*hDevice\D3D9\pd3dDevice, 1.25 * size, 0, 0, 1, style & #STYLE_ITALIC, #DEFAULT_CHARSET, #OUT_DEFAULT_PRECIS, StyleDecodeB(*hDevice, style), #DEFAULT_PITCH | #FF_DONTCARE, sName, @*hFont\id3dxf)
    EndSelect
    ProcedureReturn *hFont
  EndProcedure
  
  Procedure.l ReleaseFont(*hDevice.Device, *hFont.FONT)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hFont = 0 : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hFont\hFont
          GdipDeleteFont(*hFont\hFont)
          *hFont\hFont = 0
        EndIf
        If *hFont\hFamily
          GdipDeleteFontFamily(*hFont\hFamily)
          *hFont\hFamily = 0
        EndIf
        If *hFont\hFormat
          GdipDeleteStringFormat(*hFont\hFormat)
          *hFont\hFormat = 0
        EndIf
      Case #DEVICE_D3D9
        If *hFont\id3dxf
          *hFont\id3dxf\Release()
          *hFont\id3dxf = 0
        EndIf
    EndSelect
    FreeMemory(*hFont)
    ProcedureReturn 1
  EndProcedure
  
  Procedure.l ReleaseImage(*hDevice.Device, *hImage.IMAGE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hImage = 0 : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hImage\hGDI
          GdipDisposeImage(*hImage\hGDI)
          *hImage\hGDI = 0
        EndIf
        If *hImage\pStream
          *hImage\pStream\Release()
          *hImage\pStream = 0
        EndIf
        If *hImage\pMem
          GlobalFree_(Mem)
          *hImage\pMem = 0
        EndIf
      Case #DEVICE_D3D9
        If *hImage\d3dsprite
          *hImage\d3dsprite\Release()
          *hImage\d3dsprite = 0
        EndIf
        If *hImage\d3dtexture
          *hImage\d3dtexture\Release()
          *hImage\d3dtexture = 0
        EndIf
    EndSelect
    FreeMemory(*hImage)
    ProcedureReturn 1
  EndProcedure
  
  Procedure.l FrameNext(*hDevice.Device)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hDevice\INFO\OnMinimize = 1 : ProcedureReturn 0 : EndIf
    If *hDevice\INFO\OnRelease = 1 : ProcedureReturn 0 : EndIf
    If (GetTickCount_() - *hDevice\INFO\FPS\time) >= *hDevice\INFO\FPS\tick
      *hDevice\INFO\FPS\time = GetTickCount_()
      ProcedureReturn 1
    EndIf
    ProcedureReturn 0
  EndProcedure
  
  Procedure.l OnReSize(*hDevice.Device)
    GetClientRect_(*hDevice\INFO\hWnd, @*hDevice\INFO\tRECT)
    If (*hDevice\INFO\tRECT\bottom <= 0 And *hDevice\INFO\tRECT\right <= 0) Or (*hDevice\INFO\OnWindows = 1 And GetForegroundWindow_() <> *hDevice\INFO\hWnd)
      *hDevice\INFO\OnMinimize = 1
      ProcedureReturn 0
    Else
      If *hDevice\INFO\OnMinimize = 1
        *hDevice\INFO\OnMinimize = 0
      EndIf
    EndIf
    If CompareMemory(@*hDevice\INFO\tRECT, @*hDevice\INFO\RECT, SizeOf(RECT)) = 0 ; ReSize
      Close(*hDevice, 1)
      Create(*hDevice\INFO\hWnd, *hDevice\INFO\Device, 1, *hDevice\INFO\AlphaBlend, *hDevice\INFO\FPS\count, *hDevice\INFO\LAYERED, *hDevice)
      Select *hDevice\INFO\Device
        Case #DEVICE_GDI, #DEVICE_DC
        Case #DEVICE_D3D9
          *hDevice\INFO\OnRelease = 1
      EndSelect
      ProcedureReturn 1
    EndIf
    ProcedureReturn 0
  EndProcedure
  
  Procedure.l OnRelease(*hDevice.Device)
    If *hDevice\INFO\OnRelease = 1
      *hDevice\INFO\OnRelease = 0
      ProcedureReturn 1
    EndIf
    ProcedureReturn 0
  EndProcedure
  
  Procedure.l OnMinimize(*hDevice.Device)
    ProcedureReturn *hDevice\INFO\OnMinimize
  EndProcedure
  
  Procedure.l OnMouse(*hDevice.Device)
    If *hDevice\INFO\OnMinimize = 1 : ProcedureReturn 0 : EndIf
    If *hDevice\INFO\OnRelease = 1 : ProcedureReturn 0 : EndIf
    If GetForegroundWindow_() <> *hDevice\INFO\hWnd : ProcedureReturn 0 : EndIf
    *hDevice\INFO\MOUSE\lb = (GetAsyncKeyState_($01) & $8000)
    *hDevice\INFO\MOUSE\rb = (GetAsyncKeyState_($02) & $8000)
    If *hDevice\INFO\MOUSE\lb <> *hDevice\INFO\MOUSE\db
      *hDevice\INFO\MOUSE\db = *hDevice\INFO\MOUSE\lb
      If *hDevice\INFO\MOUSE\lb = 0
        *hDevice\INFO\MOUSE\dr = 1
      EndIf
    EndIf
    GetCursorPos_(@*hDevice\INFO\MOUSE);
    ScreenToClient_(*hDevice\INFO\hWnd, @*hDevice\INFO\MOUSE);
    If CompareMemory(@*hDevice\INFO\MOUSE\x, @*hDevice\INFO\MOUSE\x1, 8) = 0
      CopyMemory(@*hDevice\INFO\MOUSE\x, @*hDevice\INFO\MOUSE\x1, 8)
      ProcedureReturn 1
    EndIf
    ProcedureReturn 0
  EndProcedure
  
  Procedure.l GetMouse(*hDevice.Device, *x, *y, *point)
    If *point <> 0
      CopyMemory(@*hDevice\INFO\MOUSE\x, *point, 8)
    EndIf
    If *x <> 0
      PokeL(@*hDevice\INFO\MOUSE\x, *x)
    EndIf
    If *y <> 0
      PokeL(@*hDevice\INFO\MOUSE\y, *y)
    EndIf
  EndProcedure
  
  Procedure.l SetSmoothing(*hDevice.Device, Smoothing.l = #SMOOTHING_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        Select Smoothing
            Case #SMOOTHING_NONE
              GdipSetSmoothingMode(*hDevice\GDI\hContext, 0)
            Case #SMOOTHING_BLEND
              GdipSetSmoothingMode(*hDevice\GDI\hContext, 2)
        EndSelect
      Case #DEVICE_D3D9
        If *hDevice\D3D9\pd3dDevice = 0 : ProcedureReturn 0 : EndIf
        
    EndSelect
  EndProcedure
  
  Procedure.l SetDrawRect(*hDevice.Device, x.l = 0, y.l = 0, w.l = 0, h.l = 0, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If x = 0 And y = 0 And w = 0 And h = 0
          GdipResetClip(*hDevice\GDI\hContext)
        Else
          StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
          GdipSetClipRect( *hDevice\GDI\hContext, x, y, w, h, 0)
        EndIf
      Case #DEVICE_D3D9
        If *hDevice\D3D9\pd3dDevice = 0 : ProcedureReturn 0 : EndIf
        If x = 0 And y = 0 And w = 0 And h = 0
          *hDevice\D3D9\pd3dDevice\SetRenderState( #D3DRS_SCISSORTESTENABLE , #False )
        Else
          StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
          *hDevice\D3D9\pd3dDevice\SetRenderState( #D3DRS_SCISSORTESTENABLE , #True ); #D3DRS_SCISSORTESTENABLE
          *hDevice\D3D9\pScissor\left = x
          *hDevice\D3D9\pScissor\right = x + w
          *hDevice\D3D9\pScissor\top = y
          *hDevice\D3D9\pScissor\bottom = y + h
          *hDevice\D3D9\pd3dDevice\SetScissorRect(@*hDevice\D3D9\pScissor)
        EndIf
    EndSelect
  EndProcedure
  
  Procedure.l LoadFontB(*hDevice.Device, pMem, bytes.l)
    ;ProcedureReturn AddFontMemResourceEx(pMem, bytes, 0, @"1")
    ProcedureReturn CallFunction( LibGDI32, "AddFontMemResourceEx", pMem, bytes, 0, @"1")
  EndProcedure
  
  Procedure.l Format(*hDevice.Device, Format.l, Value.l = 0)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If Format = #FORMAT_OnWindows
      *hDevice\INFO\OnWindows = Value
      ProcedureReturn 1
    EndIf
    ProcedureReturn 0
  EndProcedure
    
  ;}----------------------------------------------------------
  ;-       Device -> Function -> Drawing
  ;{----------------------------------------------------------
  
  Procedure.l Rect(*hDevice.Device, x.l, y.l, w.l, h.l, color.l, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
    If IsDraw(*hDevice, x, y, w, h) : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\GDI\hPen = 0 : ProcedureReturn 0 : EndIf
        GdipSetPenColor(*hDevice\GDI\hPen, color)
        GdipDrawRectangle(*hDevice\GDI\hContext, *hDevice\GDI\hPen, x, y, w, h)
      Case #DEVICE_D3D9
        RectFill(*hDevice, x, y, w, 1, color)
        RectFill(*hDevice, x, y+1, 1, h-2, color)
        RectFill(*hDevice, x, y+h-1, w, 1, color)
        RectFill(*hDevice, x+w-1, y+1, 1, h-2, color)
    EndSelect
  EndProcedure
  
  Procedure.l RectFill(*hDevice.Device, x.l, y.l, w.l, h.l, color.l, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
    If IsDraw(*hDevice, x, y, w, h) : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\GDI\hBrush = 0 : ProcedureReturn 0 : EndIf
        GdipSetSolidFillColor(*hDevice\GDI\hBrush, color)
        GdipFillRectangleI(*hDevice\GDI\hContext, *hDevice\GDI\hBrush, x, y, w, h)
      Case #DEVICE_D3D9
        If *hDevice\D3D9\pd3dDevice = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\D3D9\pVB = 0 : ProcedureReturn 0 : EndIf
        
        *hDevice\D3D9\qV[0]\x = x
        *hDevice\D3D9\qV[0]\y = y + h
        *hDevice\D3D9\qV[0]\z = 0
        *hDevice\D3D9\qV[0]\rhw = 1
        *hDevice\D3D9\qV[0]\color = color
        
        *hDevice\D3D9\qV[1]\x = x
        *hDevice\D3D9\qV[1]\y = y
        *hDevice\D3D9\qV[1]\z = 0
        *hDevice\D3D9\qV[1]\rhw = 1
        *hDevice\D3D9\qV[1]\color = color
        
        *hDevice\D3D9\qV[2]\x = x + w
        *hDevice\D3D9\qV[2]\y = y + h
        *hDevice\D3D9\qV[2]\z = 0
        *hDevice\D3D9\qV[2]\rhw = 1
        *hDevice\D3D9\qV[2]\color = color
        
        *hDevice\D3D9\qV[3]\x = x+w
        *hDevice\D3D9\qV[3]\y = y
        *hDevice\D3D9\qV[3]\z = 0
        *hDevice\D3D9\qV[3]\rhw = 1
        *hDevice\D3D9\qV[3]\color = color
        
        *hDevice\D3D9\pVB\Lock(0, 0, @*hDevice\D3D9\pVertices, 0)
        CopyMemory(*hDevice\D3D9\qV, *hDevice\D3D9\pVertices, 4 * SizeOf(D3DTLVERTEX))
        *hDevice\D3D9\pVB\Unlock()
        *hDevice\D3D9\pd3dDevice\SetStreamSource(0,*hDevice\D3D9\pVB, 0, SizeOf(D3DTLVERTEX))
        *hDevice\D3D9\pd3dDevice\DrawPrimitive(#D3DPT_TRIANGLESTRIP, 0, 2)
    EndSelect
  EndProcedure
  
  Procedure.l LineA(*hDevice.Device, x1.l, y1.l, x2.l, y2.l, color.l, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\GDI\hPen = 0 : ProcedureReturn 0 : EndIf
        GdipSetPenColor(*hDevice\GDI\hPen, color)
        GdipDrawLine(*hDevice\GDI\hContext, *hDevice\GDI\hPen, x1, y1, x2, y2)
      Case #DEVICE_D3D9
        If *hDevice\D3D9\pd3dDevice = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\D3D9\d3dline = 0 : ProcedureReturn 0 : EndIf
        *hDevice\D3D9\qL[0]\x = x1
        *hDevice\D3D9\qL[0]\y = y1
        *hDevice\D3D9\qL[1]\x = x2
        *hDevice\D3D9\qL[1]\y = y2
        *hDevice\D3D9\d3dline\Begin()
        *hDevice\D3D9\d3dline\Draw(@*hDevice\D3D9\qL, 2, color) ; https://www.gamedev.net/topic/432827-drawing-a-3d-line-in-directx/
        *hDevice\D3D9\d3dline\End()
    EndSelect
  EndProcedure
  
  Procedure.l Arc(*hDevice.Device, x, y, w, h, startang, sweepang, color, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
    If IsDraw(*hDevice, x, y, w, h) : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\GDI\hPen = 0 : ProcedureReturn 0 : EndIf
        GdipSetPenColor(*hDevice\GDI\hPen, color)
        GdipDrawArc(*hDevice\GDI\hContext, *hDevice\GDI\hPen, x, y, w, h, startang, sweepang)
    EndSelect
  EndProcedure
  
  Procedure.l ArcEx(*hDevice.Device, x, y, w, h, startang, sweepang, color, pwidth.l, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
    If IsDraw(*hDevice, x, y, w, h) : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\GDI\hPen = 0 : ProcedureReturn 0 : EndIf
        GdipSetPenColor(*hDevice\GDI\hPen, color)
        GdipSetPenWidth(*hDevice\GDI\hPen, pwidth)
        GdipDrawArc(*hDevice\GDI\hContext, *hDevice\GDI\hPen, x, y, w, h, startang, sweepang)
        GdipSetPenWidth(*hDevice\GDI\hPen, 1)
    EndSelect
  EndProcedure
  
  Procedure.l Bezier(*hDevice.Device, x1, y1, x2, y2, x3, y3, x4, y4, color, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\GDI\hPen = 0 : ProcedureReturn 0 : EndIf
        GdipSetPenColor(*hDevice\GDI\hPen, color)
        GdipDrawBezier(*hDevice\GDI\hContext, *hDevice\GDI\hPen, x1, y1, x2, y2, x3, y3, x4, y4)
    EndSelect
  EndProcedure
  
  Procedure.l EllipseA(*hDevice.Device, x, y, w, h, ARGB, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
    If IsDraw(*hDevice, x, y, w, h) : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\GDI\hPen = 0 : ProcedureReturn 0 : EndIf
        GdipSetPenColor(*hDevice\GDI\hPen, ARGB)
        GdipDrawEllipse(*hDevice\GDI\hContext, *hDevice\GDI\hPen, x, y, w, h)
    EndSelect
  EndProcedure
  
  Procedure.l Image(*hDevice.Device, *hImage.IMAGE, x, y, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hImage = 0 : ProcedureReturn 0 : EndIf
    StyleDecodeA(*hDevice, @x, @y, @*hImage\d3dinfo\Width, @*hImage\d3dinfo\Height, @style)
    If IsDraw(*hDevice, x, y, w, h) : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hImage\hGDI = 0 : ProcedureReturn 0 : EndIf
        GdipDrawImage(*hDevice\GDI\hContext, *hImage\hGDI, x, y)
      Case #DEVICE_D3D9
        If *hImage\d3dtexture = 0 : ProcedureReturn 0 : EndIf
        If *hImage\d3dsprite = 0 : ProcedureReturn 0 : EndIf
        *hImage\d3dsprite\Begin(#D3DXSPRITE_ALPHABLEND)
        *hImage\d3dpos\x = x
        *hImage\d3dpos\y = y
        *hImage\d3dsprite\Draw(*hImage\d3dtexture, 0, 0, @*hImage\d3dpos, $FFFFFFFF); //Draw the sprite, first parameter is the image texture, 4th parameter is the position, last parameter is the color change leave to 0xFFFFFFFF for no change
        *hImage\d3dsprite\End(); //end the sprite
    EndSelect
  EndProcedure
  
  Procedure.l ImageRect(*hDevice.Device, *hImage.IMAGE, x, y, w, h, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
    If IsDraw(*hDevice, x, y, w, h) : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hImage\hGDI = 0 : ProcedureReturn 0 : EndIf
        GdipDrawImageRect(*hDevice\GDI\hContext, *hImage\hGDI, x, y, w, h)
      Case #DEVICE_D3D9
        Image(*hDevice, *hImage, x, y, 0)
    EndSelect
  EndProcedure
  
  Procedure.l ImageRectA(*hDevice.Device, *hImage.IMAGE, x, y, x2, y2, w, h, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
    If IsDraw(*hDevice, x, y, w, h) : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hImage\hGDI = 0 : ProcedureReturn 0 : EndIf
        GdipDrawImageRect(*hDevice\GDI\hContext, *hImage\hGDI, x, y, w, h)
      Case #DEVICE_D3D9
        If *hImage\d3dtexture = 0 : ProcedureReturn 0 : EndIf
        If *hImage\d3dsprite = 0 : ProcedureReturn 0 : EndIf
        *hImage\d3dsprite\Begin(#D3DXSPRITE_ALPHABLEND)
        *hImage\d3dpos\x = x
        *hImage\d3dpos\y = y
        *hImage\d3dsprite\Draw(*hImage\d3dtexture, @x2, 0, @*hImage\d3dpos, $FFFFFFFF); //Draw the sprite, first parameter is the image texture, 4th parameter is the position, last parameter is the color change leave to 0xFFFFFFFF for no change
        *hImage\d3dsprite\End(); //end the sprite
    EndSelect
  EndProcedure
  
  Procedure.l ImageSetRotateFlip(*hDevice.Device, *hImage.IMAGE, iRotateFlip.i)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hImage = 0 : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hImage\hGDI = 0 : ProcedureReturn 0 : EndIf
        GdipImageRotateFlip(*hImage\hGDI, iRotateFlip)
    EndSelect
  EndProcedure
  
  Procedure.l Pie(*hDevice.Device, x, y, w, h, startang, sweepang, ARGB, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
    If IsDraw(*hDevice, x, y, w, h) : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\GDI\hPen = 0 : ProcedureReturn 0 : EndIf
        GdipSetPenColor(*hDevice\GDI\hPen, ARGB)
        GdipDrawPie(*hDevice\GDI\hContext, *hDevice\GDI\hPen, x, y, w, h, startang, sweepang)
    EndSelect
  EndProcedure
  
  Procedure.l StringEx(*hDevice.Device, *hFont.FONT, text.s, x.l, y.l, w.l, h.l, ARGB, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hFont = 0 : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\GDI\hBrush = 0 : ProcedureReturn 0 : EndIf
        If *hFont\hFont = 0 : ProcedureReturn 0 : EndIf
        If *hFont\hFamily = 0 : ProcedureReturn 0 : EndIf
        GdipSetSolidFillColor(*hDevice\GDI\hBrush, ARGB)
        If w = -1 Or h = -1
          *hFont\FRECT\x = x
          *hFont\FRECT\y = y
          *hFont\FRECT\w = w
          *hFont\FRECT\h = h
          GdipMeasureString(*hDevice\GDI\hContext, text, -1, *hFont\hFont, @*hFont\FRECT, *hFont\hFormat, @*hFont\FRECT, 0, 0)
          w = Int(*hFont\FRECT\w) + 1
          h = Int(*hFont\FRECT\h) + 1
        EndIf
        StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
        If IsDraw(*hDevice, x, y, w, h) : ProcedureReturn 0 : EndIf
        *hFont\FRECT\x = x
        *hFont\FRECT\y = y
        *hFont\FRECT\w = w
        *hFont\FRECT\h = h
        If style & #STYLE_STRING_CENTER
          Define FRECT.FRECT
          GdipMeasureString(*hDevice\GDI\hContext, text, -1, *hFont\hFont, @FRECT, *hFont\hFormat, @FRECT, 0, 0)
          If *hFont\FRECT\w > (Int(FRECT\w) + 1)
            *hFont\FRECT\x = *hFont\FRECT\x + ((*hFont\FRECT\w / 2) - ((Int(FRECT\w) + 1) / 2))
          EndIf
          If *hFont\FRECT\h > (Int(FRECT\h) + 1)
            *hFont\FRECT\y = *hFont\FRECT\y + ((*hFont\FRECT\h / 2) - ((Int(FRECT\h) + 1) / 2))
          EndIf
        EndIf
        GdipDrawString(*hDevice\GDI\hContext, text, -1, *hFont\hFont, @*hFont\FRECT, *hFont\hFormat, *hDevice\GDI\hBrush)
      Case #DEVICE_D3D9
        If *hFont\id3dxf = 0 : ProcedureReturn 0 : EndIf
        If w = -1 Or h = -1
          *hFont\id3dxf\DrawTextW(0, @text, -1, @*hFont\RECT, #DT_CALCRECT, ARGB)
          *hFont\RECT\right = *hFont\RECT\right - *hFont\RECT\left
          *hFont\RECT\bottom = *hFont\RECT\bottom - *hFont\RECT\top
          StyleDecodeA(*hDevice, @x, @y, @*hFont\RECT\right, @*hFont\RECT\bottom, @style)
        Else
          StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
        EndIf
        If IsDraw(*hDevice, x, y, w, h) : ProcedureReturn 0 : EndIf
        *hFont\RECT\top = y
        *hFont\RECT\left = x
        *hFont\RECT\right = x + w
        *hFont\RECT\bottom = y + h
        Define DT.l = #DT_LEFT
        If style & #STYLE_STRING_CENTER
          DT = #DT_CENTER | #DT_VCENTER
        EndIf
        *hFont\id3dxf\DrawTextW(0, @text, -1, @*hFont\RECT, DT | #DT_NOCLIP, ARGB)
    EndSelect
  EndProcedure
  
  Procedure.l String(*hDevice.Device, text.s, x.l, y.l, w.l, h.l, ARGB, font.s = "Arial", size = 10, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
    If IsDraw(*hDevice, x, y, w, h) : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\GDI\hBrush = 0 : ProcedureReturn 0 : EndIf
        GdipSetSolidFillColor(*hDevice\GDI\hBrush, ARGB)
        Define hFont, hFamily, hFormat, RECT.FRECT, RECTF.FRECT
        RECT\x = x
        RECT\y = y
        RECT\w = w
        RECT\h = h
        GdipCreateFontFamilyFromName(font, 0, @hFamily)
        If hFamily
          GdipCreateFont(hFamily, size, 0, 3, @hFont)
          If hFont
            GdipCreateStringFormat(0, 0, @hFormat)
          EndIf
        EndIf
        If hFormat
          GdipMeasureString(*hDevice\GDI\hContext, text, -1, hFont, @RECT, hFormat, @RECTF, 0, 0)
          GdipDrawString(*hDevice\GDI\hContext, text, -1, hFont, @RECTF, hFormat, *hDevice\GDI\hBrush)
        EndIf
        If hFont
          GdipDeleteFont(hFont)
        EndIf
        If hFamily
          GdipDeleteFontFamily(hFamily)
        EndIf
        If hFormat
          GdipDeleteStringFormat(hFormat)
        EndIf
      Case #DEVICE_D3D9
        If *hDevice\D3D9\pd3dDevice = 0 : ProcedureReturn 0 : EndIf
        Define id3dxf.ID3DXFont
        D3DXCreateFontW(*hDevice\D3D9\pd3dDevice, 1.5 * size, 0, 0, 1, Style & #PB_Font_Italic, #DEFAULT_CHARSET, #OUT_DEFAULT_PRECIS, 2, #DEFAULT_PITCH | #FF_DONTCARE, font, @id3dxf)
        If id3dxf
          id3dxf\DrawTextW(0, @text, -1, @x, #DT_LEFT | #DT_NOCLIP, ARGB)
          id3dxf\Release()
        EndIf
    EndSelect
  EndProcedure
  
  Procedure.l Clear(*hDevice.Device, ARGB)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        GdipGraphicsClear(*hDevice\GDI\hContext, ARGB)
      Case #DEVICE_D3D9
        If *hDevice\D3D9\pd3dDevice = 0 : ProcedureReturn 0 : EndIf
        *hDevice\D3D9\pd3dDevice\Clear(0, 0, #D3DCLEAR_TARGET, ARGB, 1, 0)
    EndSelect
  EndProcedure
  
  Procedure.l EllipseFill(*hDevice.Device, x.l, y.l, w.l, h.l, ARGB, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
    If IsDraw(*hDevice, x, y, w, h) : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\GDI\hBrush = 0 : ProcedureReturn 0 : EndIf
        GdipSetSolidFillColor(*hDevice\GDI\hBrush, ARGB)
        GdipFillEllipse(*hDevice\GDI\hContext, *hDevice\GDI\hBrush, x, y, w, h)
    EndSelect
  EndProcedure
  
  Procedure.l PieFill(*hDevice.Device, x, y, w, h, startang, sweepang, ARGB, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
    If IsDraw(*hDevice, x, y, w, h) : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\GDI\hBrush = 0 : ProcedureReturn 0 : EndIf
        GdipSetSolidFillColor(*hDevice\GDI\hBrush, ARGB)
        GdipFillPieI(*hDevice\GDI\hContext, *hDevice\GDI\hBrush, x, y, w, h, startang, sweepang)
    EndSelect
  EndProcedure
  
  Procedure.l CircleA(*hDevice.Device, x, y, radius, ARGB, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\GDI\hPen = 0 : ProcedureReturn 0 : EndIf
        x = x - radius
        y = y - radius
        radius = radius * 2
        StyleDecodeA(*hDevice, @x, @y, @radius, @radius, @style)
        GdipSetPenColor(*hDevice\GDI\hPen, ARGB)
        GdipDrawEllipse(*hDevice\GDI\hContext, *hDevice\GDI\hPen, x, y, radius, radius)
      Case #DEVICE_D3D9
        If *hDevice\D3D9\pd3dDevice = 0 : ProcedureReturn 0 : EndIf
        Define radius2 = radius * 2
        StyleDecodeA(*hDevice, @x, @y, @radius2, @radius2, @style)
        For i = 0 To 360
          *hDevice\D3D9\qV[i]\x = (x + radius * Cos(#D3DX_PI * (i / 180)))
          *hDevice\D3D9\qV[i]\y = (y - radius * Sin(#D3DX_PI * (i / 180)))
          *hDevice\D3D9\qV[i]\z = 0
          *hDevice\D3D9\qV[i]\rhw = 1
          *hDevice\D3D9\qV[i]\color = ARGB
        Next
        ;*hDevice\D3D9\pd3dDevice\SetFVF(#D3DFVF_XYZRHW | #D3DFVF_DIFFUSE)
        *hDevice\D3D9\pd3dDevice\DrawPrimitiveUP(#D3DPT_LINESTRIP, 360, @*hDevice\D3D9\qV, SizeOf(D3DTLVERTEX)) ; pDevice->SetFVF(D3DFVF_XYZRHW | D3DFVF_DIFFUSE);
    EndSelect
  EndProcedure
  
  Procedure.l CircleFill(*hDevice.Device, x, y, radius, ARGB, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\GDI\hBrush = 0 : ProcedureReturn 0 : EndIf
        x = x - radius
        y = y - radius
        radius = radius * 2
        StyleDecodeA(*hDevice, @x, @y, @radius, @radius, @style)
        GdipSetSolidFillColor(*hDevice\GDI\hBrush, ARGB)
        GdipFillEllipse(*hDevice\GDI\hContext, *hDevice\GDI\hBrush, x, y, radius, radius)
      Case #DEVICE_D3D9
        If *hDevice\D3D9\pd3dDevice = 0 : ProcedureReturn 0 : EndIf
        Define radius2 = radius * 2
        StyleDecodeA(*hDevice, @x, @y, @radius2, @radius2, @style)
        
        *hDevice\D3D9\qV[0]\x = x
        *hDevice\D3D9\qV[0]\y = y
        *hDevice\D3D9\qV[0]\z = 0
        *hDevice\D3D9\qV[0]\rhw = 1
        *hDevice\D3D9\qV[0]\color = ARGB
        
        For i = 1 To 361
          *hDevice\D3D9\qV[i]\x = (x + radius * Cos(#D3DX_PI * (i / 180)))
          *hDevice\D3D9\qV[i]\y = (y - radius * Sin(#D3DX_PI * (i / 180)))
          *hDevice\D3D9\qV[i]\z = 0
          *hDevice\D3D9\qV[i]\rhw = 1
          *hDevice\D3D9\qV[i]\color = ARGB
        Next
        
;         *hDevice\D3D9\pVB\Lock(0, 0, @*hDevice\D3D9\pVertices, 0)
;         CopyMemory(*hDevice\D3D9\qV, *hDevice\D3D9\pVertices, 4 * SizeOf(D3DTLVERTEX))
;         *hDevice\D3D9\pVB\Unlock()
;         *hDevice\D3D9\pd3dDevice\SetStreamSource(0,*hDevice\D3D9\pVB, 0, SizeOf(D3DTLVERTEX))
;         *hDevice\D3D9\pd3dDevice\DrawPrimitive(#D3DPT_TRIANGLEFAN, 0, 361)
        
        ;*hDevice\D3D9\pd3dDevice\SetFVF(#D3DFVF_XYZRHW | #D3DFVF_DIFFUSE)
        *hDevice\D3D9\pd3dDevice\DrawPrimitiveUP(#D3DPT_TRIANGLEFAN, 361, @*hDevice\D3D9\qV, SizeOf(D3DTLVERTEX)) ; pDevice->SetFVF(D3DFVF_XYZRHW | D3DFVF_DIFFUSE);
    EndSelect
  EndProcedure
  ;}----------------------------------------------------------
  ;-       Device -> Function -> Drawing -> Image
  ;{----------------------------------------------------------
  
  ;}----------------------------------------------------------
  ;-       Device -> Function -> Drawing -> Button (UI)
  ;{----------------------------------------------------------
  
  Procedure.l UIButton(*hDevice.Device, *ptr1, *ptr2, *ptr3, x.l, y.l, w.l, h.l, style.l = #UI_STYLE_IMAGE, wstyle.l = #STYLE_NONE)
    StyleDecodeA(*hDevice, @x, @y, @w, @h, @wstyle)
    If IsDraw(*hDevice, x, y, w, h) : ProcedureReturn 0 : EndIf
    *hDevice\INFO\MOUSE\m = 0
    If *hDevice\INFO\MOUSE\x > x And *hDevice\INFO\MOUSE\y > y And *hDevice\INFO\MOUSE\x <= (x+w) And *hDevice\INFO\MOUSE\y <= (y+h)
      If *hDevice\INFO\MOUSE\dr
        *hDevice\INFO\MOUSE\m = 3
      ElseIf *hDevice\INFO\MOUSE\lb
        *hDevice\INFO\MOUSE\m = 2
      Else
        *hDevice\INFO\MOUSE\m = 1
      EndIf
    EndIf
    Select style
      Case #UI_STYLE_IMAGE
        If *hDevice\INFO\MOUSE\m > 1
          Image(*hDevice, *ptr3, x, y)
        ElseIf *hDevice\INFO\MOUSE\m = 1
          Image(*hDevice, *ptr2, x, y)
        Else
          Image(*hDevice, *ptr1, x, y)
        EndIf
      Case #UI_STYLE_COLOR
        If *hDevice\INFO\MOUSE\m > 1
          RectFill(*hDevice, x, y, w, h, *ptr3)
        ElseIf *hDevice\INFO\MOUSE\m = 1
          RectFill(*hDevice, x, y, w, h, *ptr2)
        Else
          RectFill(*hDevice, x, y, w, h, *ptr1)
        EndIf
      Case #UI_STYLE_COLIM
        Image(*hDevice, *ptr1, x, y)
        If *hDevice\INFO\MOUSE\m = 1
          RectFill(*hDevice, x, y, w, h, *ptr3)
        ElseIf *hDevice\INFO\MOUSE\m = 2
          RectFill(*hDevice, x, y, w, h, *ptr2)
        EndIf
      Case #UI_STYLE_COLIM_RECT
        ImageRect(*hDevice, *ptr1, x, y, w, h)
        If *hDevice\INFO\MOUSE\m = 1
          RectFill(*hDevice, x, y, w, h, *ptr3)
        ElseIf *hDevice\INFO\MOUSE\m = 2
          RectFill(*hDevice, x, y, w, h, *ptr2)
        EndIf
    EndSelect
;     *hDevice\INFO\RECT\right
    ProcedureReturn *hDevice\INFO\MOUSE\m
  EndProcedure
  
  ;}----------------------------------------------------------
  ;-       Device -> Function -> Drawing -> UInput (UI)
  ;{----------------------------------------------------------
  
  Procedure.l UInputCreate(*hDevice.Device, nfont.s, sfont.l, UIStyle.l = #INPUT_DEFAUT, text.s = "", placehold.s = "")
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    Protected *hUInput.UInput = AllocateMemory(SizeOf(UInput))
    *hUInput\Device = *hDevice
    *hUInput\UIStyle\style = UIStyle
    *hUInput\hFont = LoadFontA(*hDevice, nfont, sfont)
    *hUInput\UInput = text
    *hUInput\placehold = placehold
    *hUInput\FName = nfont
    *hUInput\FSize = sfont
    *hUInput\UIcPOINT\yh = ElapsedMilliseconds()
    *hUInput\UIColor\background = $FFFFFFFF
    *hUInput\UIColor\border = $FF000000
    *hUInput\UIColor\cursor = $FF000000
    *hUInput\UIColor\text = $FF000000
    *hUInput\UIColor\selec_t = $FF0094FF
    *hUInput\UIColor\selec_text = $FF000000
    *hUInput\UIColor\focus = $FF0094FF
    *hUInput\UIColor\placeholder = $FF4F4F4F
    *hUInput\UIStyle\padding = 5
    ProcedureReturn *hUInput
  EndProcedure
  
  Procedure.l UInputClose(*hDevice.Device, *hUInput.UInput)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hUInput = 0 : ProcedureReturn 0 : EndIf
    FreeMemory(*hUInput)
    ProcedureReturn 1
  EndProcedure
  
  Procedure.l UInputOnRelease(*hDevice.Device, *hUInput.UInput)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hUInput = 0 : ProcedureReturn 0 : EndIf
    *hUInput\hFont = LoadFontA(*hDevice, *hUInput\FName, *hUInput\FSize, #STYLE_QUALTY_FULL, *hUInput\hFont)
  EndProcedure
  
  Procedure.l UInputDraw(*hDevice.Device, *hUInput.UInput, x.l, y.l, w.l, h.l, Style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hUInput = 0 : ProcedureReturn 0 : EndIf
    
    StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
    
    *hUInput\UIVector\x = x
    *hUInput\UIVector\y = y
    *hUInput\UIVector\w = w
    *hUInput\UIVector\h = h
    *hUInput\UIVector\xw = x + w
    *hUInput\UIVector\yh = y + h
    
    ;-- Calc --
    
    *hUInput\UInVector\x = *hUInput\UIVector\x + *hUInput\UIStyle\padding
    If *hUInput\UIStyle\style & #INPUT_RECT_CENTER
      If *hUInput\UInput = "" And *hUInput\placehold <> ""
        *hUInput\UInVector\x = *hUInput\UIVector\x + *hUInput\UIStyle\padding + (((*hUInput\UIVector\w-(*hUInput\UIStyle\padding * 2)) / 2) - (StringInfoW(*hDevice, *hUInput\hFont, *hUInput\placehold) / 2))
      Else
        *hUInput\UInVector\x = *hUInput\UIVector\x + *hUInput\UIStyle\padding + (((*hUInput\UIVector\w-(*hUInput\UIStyle\padding * 2)) / 2) - (StringInfoW(*hDevice, *hUInput\hFont, *hUInput\UInput) / 2))
      EndIf
    EndIf
    If *hUInput\UInput = "" And *hUInput\placehold <> ""
      *hUInput\UInVector\y = *hUInput\UIVector\y + ((*hUInput\UIVector\h / 2) - (StringInfoH(*hDevice, *hUInput\hFont, *hUInput\placehold) / 2))
    Else
      *hUInput\UInVector\y = *hUInput\UIVector\y + ((*hUInput\UIVector\h / 2) - (StringInfoH(*hDevice, *hUInput\hFont, *hUInput\UInput) / 2))
    EndIf
    
    If Not *hUInput\UIStyle\style & #INPUT_NOSTYLE
      RectFill(*hDevice, x, y, w, h, *hUInput\UIColor\background)
      If *hUInput\focus = 0
        Rect(*hDevice, x, y, w, h, *hUInput\UIColor\border)
      Else
        Rect(*hDevice, x, y, w, h, *hUInput\UIColor\focus)
      EndIf
    EndIf
    If *hUInput\focus = 0 And *hUInput\UInput = "" And *hUInput\placehold <> ""
      StringEx(*hDevice, *hUInput\hFont, *hUInput\placehold, *hUInput\UInVector\x, *hUInput\UInVector\y, -1, -1, *hUInput\UIColor\placeholder, #STYLE_NONE)
    Else
      StringEx(*hDevice, *hUInput\hFont, *hUInput\UInput, *hUInput\UInVector\x, *hUInput\UInVector\y, -1, -1, *hUInput\UIColor\text, #STYLE_NONE)
      If *hUInput\focus = 1
        If *hUInput\UInput <> "" And *hUInput\UIcPOINT\xw = 1
          RectFill(*hDevice, *hUInput\UIcPOINT\x, *hUInput\UIcPOINT\y, 1, *hUInput\UIcPOINT\h, *hUInput\UIColor\cursor)
        EndIf
        If (ElapsedMilliseconds() - *hUInput\UIcPOINT\yh) > 500
          *hUInput\UIcPOINT\yh = ElapsedMilliseconds()
          If *hUInput\UIcPOINT\xw = 0
            *hUInput\UIcPOINT\xw = 1
          Else
            *hUInput\UIcPOINT\xw = 0
          EndIf
        EndIf
      EndIf
    EndIf
  EndProcedure
  
  Procedure.l OnUInput(*hDevice.Device, *hUInput.UInput, event.l, wParam.l = -1)
    EnableDebugger
    If wParam = -1 : wParam = EventwParam() : EndIf
    Protected tText.s, i.l
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hUInput = 0 : ProcedureReturn 0 : EndIf
    If *hDevice\INFO\MOUSE\x >= *hUInput\UIVector\x And *hDevice\INFO\MOUSE\x <= (*hUInput\UIVector\xw) And *hDevice\INFO\MOUSE\y >= *hUInput\UIVector\y And *hDevice\INFO\MOUSE\y <= (*hUInput\UIVector\yh)
      If *hUInput\focus = 1 And *hDevice\INFO\MOUSE\dr
        If *hUInput\UInput <> ""
          For i=0 To Len(*hUInput\UInput)
            *hFont.FONT = StringInfoFONT(*hDevice, *hUInput\hFont, Left(*hUInput\UInput, i))
            If (*hUInput\UInVector\x + *hFont\FRECT\w) > *hDevice\INFO\MOUSE\x
              *hUInput\UICursor = Len(*hUInput\UInput) - (i - 1)
              Goto LoadCursorL
            EndIf
          Next
          *hUInput\UICursor = 0
          Goto LoadCursorL
        ElseIf *hUInput\UICursor <> 0
          *hUInput\UICursor = 0
          Goto LoadCursorL
        EndIf
      EndIf
      If *hDevice\INFO\MOUSE\dr
        *hUInput\focus = 1
      EndIf
    ElseIf *hDevice\INFO\MOUSE\db
      *hUInput\focus = 0
    EndIf
    If *hUInput\focus = 1
      If event = #WM_KEYDOWN
        If wParam = 17
          *hUInput\UIKey\ctrl = 1
        EndIf
      EndIf
      If event = #WM_KEYUP
        If wParam = 46 And *hUInput\UInput <> "" And *hUInput\UICursor > 0
          *hUInput\UIcPOINT\yh = ElapsedMilliseconds()
          *hUInput\UIcPOINT\xw = 1
          *hUInput\UICursor = *hUInput\UICursor - 1
          *hUInput\UInput = Left(*hUInput\UInput, Len(*hUInput\UInput) - *hUInput\UICursor - 1) + Right(*hUInput\UInput, *hUInput\UICursor) 
          Goto LoadCursorL
        EndIf
        If wParam = 13 And *hUInput\UIfunc\ENTER <> 0 And *hUInput\UInput <> ""
          CallFunctionFast(*hUInput\UIfunc\ENTER, *hUInput)
        EndIf
        If wParam = 17 And *hUInput\UIKey\ctrl = 1
          *hUInput\UIKey\ctrl = 0
        EndIf
        If wParam = 37 ; <= 39 =>
          If *hUInput\UInput <> ""
            *hUInput\UICursor = *hUInput\UICursor + 1
            If Len(*hUInput\UInput) < *hUInput\UICursor
              *hUInput\UICursor = Len(*hUInput\UInput)
            EndIf
            *hUInput\UIcPOINT\yh = ElapsedMilliseconds()
            *hUInput\UIcPOINT\xw = 1
            Goto LoadCursorL
          EndIf
        EndIf
        If wParam = 39
          If *hUInput\UInput <> ""
            *hUInput\UICursor = *hUInput\UICursor - 1
            If *hUInput\UICursor < 0
              *hUInput\UICursor = 0
            EndIf
            *hUInput\UIcPOINT\yh = ElapsedMilliseconds()
            *hUInput\UIcPOINT\xw = 1
            Goto LoadCursorL
          EndIf
        EndIf
      EndIf
      If event = #WM_CHAR And *hUInput\UIKey\ctrl = 0
        tText = *hUInput\UInput
        If wParam = 8
          If *hUInput\UICursor = 0
            *hUInput\UInput = Left(*hUInput\UInput, Len(*hUInput\UInput) - 1)
          Else
            
          EndIf
        ElseIf wParam <> 13
          *hUInput\UIcPOINT\yh = ElapsedMilliseconds()
          *hUInput\UIcPOINT\xw = 1
          If *hUInput\UICursor = 0
            *hUInput\UInput = *hUInput\UInput + Chr(wParam)
          Else
            *hUInput\UInput = Left(*hUInput\UInput, Len(*hUInput\UInput) - *hUInput\UICursor) + Chr(wParam) + Right(*hUInput\UInput, *hUInput\UICursor) 
          EndIf
        EndIf
        LoadCursorL:
        If *hUInput\UICursor > 0
          *hFont.FONT = StringInfoFONT(*hDevice, *hUInput\hFont, Left(*hUInput\UInput, Len(*hUInput\UInput) - *hUInput\UICursor))
        Else
          *hFont.FONT = StringInfoFONT(*hDevice, *hUInput\hFont, *hUInput\UInput)
        EndIf
        If (*hFont\FRECT\w + (*hUInput\UIStyle\padding * 2)) > *hUInput\UIVector\w
          *hUInput\UInput = tText
          *hFont.FONT = StringInfoFONT(*hDevice, *hUInput\hFont, *hUInput\UInput)
        EndIf
        *hUInput\UIcPOINT\x = *hUInput\UInVector\x + *hFont\FRECT\w
        *hUInput\UIcPOINT\y = *hUInput\UIVector\y + ((*hUInput\UIVector\h / 2) - (*hFont\FRECT\h / 2))
        *hUInput\UIcPOINT\h = *hFont\FRECT\h
        tText = ""
       ; *hFont\FRECT\h
      EndIf
    EndIf
  EndProcedure
  
  ;}----------------------------------------------------------
  ;-       Device -> Function -> Drawing -> Scroll
  ;{----------------------------------------------------------
  Procedure.l CreateScrollRegion(*hDevice.Device, x.l, y.l, w.l, h.l, scroll.l = 1, region.l = 1, speed_end.l = 3, speed.l = 10, type.l = 0, style.l = #STYLE_NONE, scroll_back.l = $10000000, scroll_color.l = $40000000)
    Protected *hScroll.SCROLL = AllocateMemory(SizeOf(SCROLL))
    StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
    *hScroll\device = *hDevice
    *hScroll\x = x
    *hScroll\y = y
    *hScroll\w = w
    *hScroll\h = h
    *hScroll\scroll = scroll
    *hScroll\region = region
    *hScroll\speed_end = speed_end
    *hScroll\speed = speed
    *hScroll\type = type
    *hScroll\style = style
    *hScroll\scroll_back = scroll_back
    *hScroll\scroll_color = scroll_color
    If *hScroll\type = 2
      *hScroll\speed_end = 1
    EndIf
    ProcedureReturn *hScroll
  EndProcedure
  
  Procedure.l ScrollBegin(*hDevice.Device, *hScroll.SCROLL)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hScroll = 0 : ProcedureReturn 0 : EndIf
    If *hScroll\region = 1 : SetDrawRect(*hDevice, *hScroll\x, *hScroll\y, *hScroll\w, *hScroll\h) : EndIf
  EndProcedure
  
  Procedure.l ScrollEnd(*hDevice.Device, *hScroll.SCROLL, Max.l)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hScroll = 0 : ProcedureReturn 0 : EndIf
    If *hScroll\type = 2 : Max = ((Max + 1) * *hScroll\w) : EndIf
    If *hScroll\pos_scroll_t > 0
      *hScroll\pos_scroll_t = *hScroll\pos_scroll_t - *hScroll\speed_end
      If *hScroll\pos_scroll_a = 1
        *hScroll\pos_scroll_b = *hScroll\pos_scroll_b - *hScroll\pos_scroll_t
        If *hScroll\type = 2 ; type 2
          If *hScroll\pos_scroll_b < *hScroll\pos_scroll_n
            *hScroll\pos_scroll_t = 0
            *hScroll\pos_scroll_b = *hScroll\pos_scroll_n
          ElseIf *hScroll\pos_scroll_n < *hScroll\pos_scroll_b
            *hScroll\pos_scroll_t = *hScroll\speed
          EndIf
        EndIf
      ElseIf *hScroll\pos_scroll_a = -1
        *hScroll\pos_scroll_b = *hScroll\pos_scroll_b + *hScroll\pos_scroll_t
        If *hScroll\type = 2 ; type 2
          If *hScroll\pos_scroll_b > *hScroll\pos_scroll_n
            *hScroll\pos_scroll_t = 0
            *hScroll\pos_scroll_b = *hScroll\pos_scroll_n
          ElseIf *hScroll\pos_scroll_n > *hScroll\pos_scroll_b
            *hScroll\pos_scroll_t = *hScroll\speed
          EndIf
        EndIf
      EndIf
      
      If Max > *hScroll\h
         If *hScroll\pos_scroll_b > 0
           *hScroll\pos_scroll_b = 0
           *hScroll\pos_scroll_t = 0
         EndIf
         If *hScroll\type = 0
           If *hScroll\pos_scroll_b < -(Max - *hScroll\h)
             *hScroll\pos_scroll_b = -(Max - *hScroll\h)
             *hScroll\pos_scroll_t = 0
           EndIf
         ElseIf *hScroll\type = 1 Or *hScroll\type = 2
           If *hScroll\pos_scroll_b < -(Max - *hScroll\w)
             *hScroll\pos_scroll_b = -(Max - *hScroll\w)
             *hScroll\pos_scroll_t = 0
           EndIf
         EndIf
      Else
        *hScroll\pos_scroll_b = 0
        *hScroll\pos_scroll_t = 0
      EndIf
    EndIf
    If *hScroll\w_scroll <> 0 ; Speed
      If *hScroll\type < 2
        If *hScroll\pos_scroll_a <> *hScroll\w_scroll And *hScroll\w_scroll <> 0
          *hScroll\pos_scroll_t = 0
          *hScroll\pos_scroll_a = *hScroll\w_scroll
        EndIf
        *hScroll\pos_scroll_t = *hScroll\pos_scroll_t + *hScroll\speed
      ElseIf *hScroll\type = 2 And *hScroll\pos_scroll_t <= 0
        *hScroll\pos_scroll_t = *hScroll\speed
        *hScroll\pos_scroll_a = *hScroll\w_scroll
        If *hScroll\w_scroll = 1
          *hScroll\pos_scroll_n = *hScroll\pos_scroll_b - *hScroll\w
        Else
          *hScroll\pos_scroll_n = *hScroll\pos_scroll_b + *hScroll\w
        EndIf
      EndIf
      *hScroll\w_scroll = 0
    EndIf
    
    If *hScroll\scroll = 1 ; DrawScroll xD
      If *hScroll\type = 0
        RectFill(*hDevice, (*hScroll\x + *hScroll\w) - 2, *hScroll\y, 2, *hScroll\h, *hScroll\scroll_back)
        If Max > *hScroll\h
          *hScroll\scroll_temp = *hScroll\h - ((Max - *hScroll\h) / 2)
          If *hScroll\scroll_temp < 10
            *hScroll\scroll_temp = 10
          EndIf
          *hScroll\scroll_dat = ((*hScroll\h - *hScroll\scroll_temp) / 100) * ((-*hScroll\pos_scroll_b) / ((Max - *hScroll\h) / 100))
          RectFill(*hDevice, (*hScroll\x + *hScroll\w) - 2, *hScroll\y + *hScroll\scroll_dat, 2, *hScroll\scroll_temp, *hScroll\scroll_color)
        EndIf
      ElseIf *hScroll\type = 1 Or *hScroll\type = 2
        RectFill(*hDevice, *hScroll\x, *hScroll\y + *hScroll\h - 2, *hScroll\w, 2, *hScroll\scroll_back)
        If Max > *hScroll\w
          *hScroll\scroll_temp = *hScroll\w - ((Max - *hScroll\w) / 2)
          If *hScroll\scroll_temp < 10
            *hScroll\scroll_temp = 10
          EndIf
          *hScroll\scroll_dat = ((*hScroll\w - *hScroll\scroll_temp) / 100) * ((-*hScroll\pos_scroll_b) / ((Max - *hScroll\w) / 100))
          RectFill(*hDevice, *hScroll\x + *hScroll\scroll_dat, *hScroll\y + *hScroll\h - 2, *hScroll\scroll_temp, 2, *hScroll\scroll_color)
        EndIf
      EndIf
    EndIf
    
    If *hScroll\region = 1 : SetDrawRect(*hDevice) : EndIf
  EndProcedure
  
  Procedure.l GetScroll(*hDevice.Device, *hScroll.SCROLL)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hScroll = 0 : ProcedureReturn 0 : EndIf
    ProcedureReturn *hScroll\pos_scroll_b
  EndProcedure
  
  Procedure.l GetScrollCount(*hDevice.Device, *hScroll.SCROLL)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hScroll = 0 : ProcedureReturn 0 : EndIf
    ProcedureReturn -*hScroll\pos_scroll_b / *hScroll\w
  EndProcedure
    
  Procedure.l OnScroll(*hDevice.Device, *hScroll.SCROLL, event.l, wParam.l = 0)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hScroll = 0 : ProcedureReturn 0 : EndIf
    If wParam = 0 : wParam = EventwParam() : EndIf
    If event = #WM_MOUSEWHEEL
      *hScroll\w_scroll = ((wParam >> 16) & $FFFF)
      *hScroll\w_scroll = -(*hScroll\w_scroll / 100)
    EndIf
    If event = #WM_KEYDOWN
      If *hScroll\type > 0
        If wParam = 37; Left
          *hScroll\w_scroll = -1
        EndIf
        If wParam = 39 ; Right
          *hScroll\w_scroll = 1
        EndIf
      Else
        If wParam = 38 ; UP
          *hScroll\w_scroll = -1
        EndIf
        If wParam = 40 ; Down
          *hScroll\w_scroll = 1
        EndIf
      EndIf
    EndIf
  EndProcedure
  
  Procedure.l SetScrollRegion(*hDevice.Device, *hScroll.SCROLL, x.l, y.l, w.l, h.l, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hScroll = 0 : ProcedureReturn 0 : EndIf
    StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
    If *hScroll\type < 2
      *hScroll\pos_scroll_b = 0
    ElseIf *hScroll\type = 2
      Protected count = GetScrollCount(*hDevice, *hScroll)
      *hScroll\pos_scroll_b = -(count * w)
      *hScroll\pos_scroll_t = 0
      *hScroll\pos_scroll_n = -(count * w)
    EndIf
    *hScroll\x = x
    *hScroll\y = y
    *hScroll\w = w
    *hScroll\h = h
    *hScroll\style = style
  EndProcedure
  
  Procedure.l ResetScroll(*hDevice.Device, *hScroll.SCROLL)
    *hScroll\pos_scroll_b = 0
  EndProcedure
  
  ;}----------------------------------------------------------
  ;-       Device -> Function -> Drawing -> String
  ;{----------------------------------------------------------
  
  Procedure.l StringCRLF(*hDevice.Device, *hFont.FONT, text.s, x.l, y.l, w.l, h.l, ARGB, style.l = #STYLE_NONE, interval.l = 25, line.l = $FFFF, Delimiter.s = "\r", style_d.l = 0)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hFont = 0 : ProcedureReturn 0 : EndIf
    Protected i, y_p
    If style_d = 0
      StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
      style_d = #STYLE_NONE
    Else
      style_d = style
    EndIf
    y_p = y
    For i = 1 To line
      If StringField(text, i, Delimiter) = ""
        ProcedureReturn i
        Break
      EndIf
      StringEx(*hDevice, *hFont, StringField(text, i, Delimiter), x.l, y_p, w.l, h.l, ARGB, style_d)
      y_p = y_p + interval
    Next
  EndProcedure
  
  Procedure.l StringLine(*hDevice.Device, text.s, line.l = $FFFF, Delimiter.s = "\r")
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    For i = 1 To line
      If StringField(text, i, Delimiter) = ""
        ProcedureReturn i
        Break
      EndIf
    Next
    ProcedureReturn 0
  EndProcedure
  
  Procedure.l StringInfoW(*hDevice.Device, *hFont.FONT, text.s)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hFont = 0 : ProcedureReturn 0 : EndIf
    text = ReplaceString(text, " ", ",")
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\GDI\hBrush = 0 : ProcedureReturn 0 : EndIf
        If *hFont\hFont = 0 : ProcedureReturn 0 : EndIf
        If *hFont\hFamily = 0 : ProcedureReturn 0 : EndIf
        *hFont\FRECT\h = -1
        *hFont\FRECT\w = -1
        *hFont\FRECT\x = 0
        *hFont\FRECT\y = 0
        GdipMeasureString(*hDevice\GDI\hContext, text, -1, *hFont\hFont, @*hFont\FRECT, *hFont\hFormat, @*hFont\FRECT, 0, 0)
        *hFont\FRECT\w = Int(*hFont\FRECT\w) + 1
        *hFont\FRECT\h = Int(*hFont\FRECT\h) + 1
        ProcedureReturn *hFont\FRECT\w
      Case #DEVICE_D3D9
        If *hFont\id3dxf = 0 : ProcedureReturn 0 : EndIf
        *hFont\id3dxf\DrawTextW(0, @text, -1, @*hFont\RECT, #DT_CALCRECT, $00000000)
        *hFont\FRECT\w = *hFont\RECT\right - *hFont\RECT\left
        *hFont\FRECT\h = *hFont\RECT\bottom - *hFont\RECT\top
        ProcedureReturn *hFont\FRECT\w
    EndSelect
    ProcedureReturn 0
  EndProcedure
  
  Procedure.l StringInfoH(*hDevice.Device, *hFont.FONT, text.s)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hFont = 0 : ProcedureReturn 0 : EndIf
    text = ReplaceString(text, " ", ",")
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\GDI\hBrush = 0 : ProcedureReturn 0 : EndIf
        If *hFont\hFont = 0 : ProcedureReturn 0 : EndIf
        If *hFont\hFamily = 0 : ProcedureReturn 0 : EndIf
        *hFont\FRECT\h = -1
        *hFont\FRECT\w = -1
        *hFont\FRECT\x = 0
        *hFont\FRECT\y = 0
        GdipMeasureString(*hDevice\GDI\hContext, text, -1, *hFont\hFont, @*hFont\FRECT, *hFont\hFormat, @*hFont\FRECT, 0, 0)
        *hFont\FRECT\w = Int(*hFont\FRECT\w) + 1
        *hFont\FRECT\h = Int(*hFont\FRECT\h) + 1
        ProcedureReturn *hFont\FRECT\h
      Case #DEVICE_D3D9
        If *hFont\id3dxf = 0 : ProcedureReturn 0 : EndIf
        *hFont\id3dxf\DrawTextW(0, @text, -1, @*hFont\RECT, #DT_CALCRECT, $00000000)
        *hFont\FRECT\w = *hFont\RECT\right - *hFont\RECT\left
        *hFont\FRECT\h = *hFont\RECT\bottom - *hFont\RECT\top
        ProcedureReturn *hFont\FRECT\h
    EndSelect
    ProcedureReturn 0
  EndProcedure
  
  Procedure.l StringInfoFONT(*hDevice.Device, *hFont.FONT, text.s)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hFont = 0 : ProcedureReturn 0 : EndIf
    text = ReplaceString(text, " ", ",")
    Select *hDevice\INFO\Device
      Case #DEVICE_GDI, #DEVICE_DC
        If *hDevice\GDI\hContext = 0 : ProcedureReturn 0 : EndIf
        If *hDevice\GDI\hBrush = 0 : ProcedureReturn 0 : EndIf
        If *hFont\hFont = 0 : ProcedureReturn 0 : EndIf
        If *hFont\hFamily = 0 : ProcedureReturn 0 : EndIf
        *hFont\FRECT\h = -1
        *hFont\FRECT\w = -1
        *hFont\FRECT\x = 0
        *hFont\FRECT\y = 0
        GdipMeasureString(*hDevice\GDI\hContext, text, -1, *hFont\hFont, @*hFont\FRECT, *hFont\hFormat, @*hFont\FRECT, 0, 0)
        *hFont\FRECT\w = Int(*hFont\FRECT\w) - 1
        *hFont\FRECT\h = Int(*hFont\FRECT\h) - 1
        ProcedureReturn *hFont
      Case #DEVICE_D3D9
        If *hFont\id3dxf = 0 : ProcedureReturn 0 : EndIf
        *hFont\id3dxf\DrawTextW(0, @text, -1, @*hFont\RECT, #DT_CALCRECT, $00000000)
        *hFont\FRECT\w = *hFont\RECT\right - *hFont\RECT\left
        *hFont\FRECT\h = *hFont\RECT\bottom - *hFont\RECT\top
        ProcedureReturn *hFont
    EndSelect
    ProcedureReturn 0
  EndProcedure
  
  ;}----------------------------------------------------------
  ;-       Device -> Function -> Drawing -> Chart (UI)
  ;{----------------------------------------------------------
  
  Procedure.l UIBarChartCreateStructColumn(*hDevice.Device, nfont.s = "Arial", sfont.l = 9)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If color = 0 : color = $FF000000 + Random($FFFFFF) : EndIf
    Protected *hUIBarChart.UIBarChart = AllocateMemory(SizeOf(UIBarChart))
    *hUIBarChart\nfont = nfont
    *hUIBarChart\sfont = sfont
    *hUIBarChart\hFont = LoadFontA(*hDevice, *hUIBarChart\nfont, *hUIBarChart\sfont)
    *hUIBarChart\column = AllocateMemory(1)
    *hUIBarChart\count = -1
    *hUIBarChart\UIStyle\padding = 5
    *hUIBarChart\UIStyle\SizeText = 25
    *hUIBarChart\UIColor\text = $FF000000
    ProcedureReturn *hUIBarChart
  EndProcedure
  
  Procedure.l UIBarChartReleaseStruct(*hDevice.Device, *hUIBarChart.UIBarChart)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hUIBarChart = 0 : ProcedureReturn 0 : EndIf
    *hUIBarChart\column = FreeMemory(*hUIBarChart\column)
    *hUIBarChart\hFont =  ReleaseFont(*hDevice, *hUIBarChart\hFont)
    Define result.l = FreeMemory(*hUIBarChart)
    *hUIBarChart = 0
    ProcedureReturn result
  EndProcedure
  
  Procedure.l UIBarChartAddColumn(*hDevice.Device, *hUIBarChart.UIBarChart, size.l, Name.s = "", color.l = 0)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hUIBarChart = 0 : ProcedureReturn 0 : EndIf
    If color = 0 : color = $FF000000 + Random($FFFFFF) : EndIf
    If *hUIBarChart\full < size : *hUIBarChart\full = size : EndIf
    *hUIBarChart\count = (*hUIBarChart\count + 1) ; 1
    
    *hUIBarChart\column = ReAllocateMemory(*hUIBarChart\column, #UI_BARCHART_BYTES * (*hUIBarChart\count + 1))
    
    PokeL(*hUIBarChart\column + (*hUIBarChart\count * #UI_BARCHART_BYTES), size)
    PokeL(*hUIBarChart\column + ((*hUIBarChart\count * #UI_BARCHART_BYTES) + 4), color)
    If Name <> ""
      PokeS(*hUIBarChart\column + ((*hUIBarChart\count * #UI_BARCHART_BYTES) + 8), Name, 30)
      *hUIBarChart\ShowName = 1
    EndIf
    ProcedureReturn *hUIBarChart\count
  EndProcedure
  
  Procedure.l UIBarChartEditColunm(*hDevice.Device, *hUIBarChart.UIBarChart, ID.l, size.l, Name.s = "", color.l = 0)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hUIBarChart = 0 : ProcedureReturn 0 : EndIf
    If *hUIBarChart\count < ID : ProcedureReturn 0 : EndIf
    If *hUIBarChart\full < size : *hUIBarChart\full = size : EndIf
    PokeL(*hUIBarChart\column + (ID * #UI_BARCHART_BYTES), size)
    If color <> 0 : PokeL(*hUIBarChart\column + ((*hUIBarChart\count * #UI_BARCHART_BYTES) + 4), color) : EndIf
    If Name <> "" : PokeS(*hUIBarChart\column + ((*hUIBarChart\count * #UI_BARCHART_BYTES) + 8), Name, 30) : EndIf
    ProcedureReturn *hUIBarChart\column
  EndProcedure
  
  Procedure.l UIBarChartDraw(*hDevice.Device, *hUIBarChart.UIBarChart, x.l, y.l, w.l, h.l, style.l = #STYLE_NONE)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hUIBarChart = 0 : ProcedureReturn 0 : EndIf
    If *hUIBarChart\count < 0 : ProcedureReturn 0 : EndIf
    StyleDecodeA(*hDevice, @x, @y, @w, @h, @style)
    If IsDraw(*hDevice, x, y, w, h) : ProcedureReturn 0 : EndIf
    Define tI.l, zX.l = *hUIBarChart\UIStyle\padding, gW.l = (w - *hUIBarChart\UIStyle\padding) / (*hUIBarChart\count + 1), gH.f, gJ.l, gK.l
    If *hUIBarChart\ShowName = 1
      gK.l = *hUIBarChart\UIStyle\SizeText
    EndIf
    ; Info
    If *hUIBarChart\full > (h - (*hUIBarChart\UIStyle\padding * 2))
      gH.f = *hUIBarChart\full / (h - (*hUIBarChart\UIStyle\padding * 2) - gK)
    Else
      gH.f = (h - (*hUIBarChart\UIStyle\padding * 2) - gK) / *hUIBarChart\full
    EndIf
    ; UIColor
    If *hUIBarChart\UIColor\background <> 0 : RectFill(*hDevice, x, y, w, h, *hUIBarChart\UIColor\background) : EndIf
    ; Colunm Render
    For tI.l = 0 To *hUIBarChart\count
      If *hUIBarChart\full > (h - (*hUIBarChart\UIStyle\padding * 2))
        gJ = (PeekL(*hUIBarChart\column + (tI * #UI_BARCHART_BYTES)) / gH) - 1
      Else
        gJ = (PeekL(*hUIBarChart\column + (tI * #UI_BARCHART_BYTES)) * gH) - 1
      EndIf
      If gJ <= 0
        gJ = 1
      EndIf
      RectFill(*hDevice, x + zX, (y - *hUIBarChart\UIStyle\padding - gK) + (h - gJ), gW - *hUIBarChart\UIStyle\padding, gJ, PeekL(*hUIBarChart\column + ((tI * #UI_BARCHART_BYTES) + 4)))
      StringEx(*hDevice, *hUIBarChart\hFont, PeekS(*hUIBarChart\column + ((tI * #UI_BARCHART_BYTES) + 8), 30), x + zX, ((y + h) - *hUIBarChart\UIStyle\padding) - gK, (gW - *hUIBarChart\UIStyle\padding), gK, *hUIBarChart\UIColor\text, #STYLE_STRING_CENTER)
      zX = zX + gW
    Next
    ProcedureReturn 1
  EndProcedure
  
  Procedure.l UIChartOnRelease(*hDevice.Device, *hUIBarChart.UIBarChart)
    If *hDevice = 0 : ProcedureReturn 0 : EndIf
    If *hUIBarChart = 0 : ProcedureReturn 0 : EndIf
    *hUIBarChart\hFont = LoadFontA(*hDevice, *hUIBarChart\nfont, *hUIBarChart\sfont, #STYLE_QUALTY_FULL, *hUIBarChart\hFont)
  EndProcedure
  
  ;}----------------------------------------------------------
  ;-       Device -> Function -> Drawing -> Debug
  ;{----------------------------------------------------------
  
  Procedure.l DebugFps(*hDevice.Device)
    If GetTickCount_() > *hDevice\INFO\FPS\tframe
      *hDevice\INFO\FPS\tframe = GetTickCount_() + 1000
      Debug "fps: " + Str(*hDevice\INFO\FPS\frame)
      *hDevice\INFO\FPS\frame = 0
    Else
      *hDevice\INFO\FPS\frame + 1
    EndIf
  EndProcedure
  
  ;}----------------------------------------------------------
  ;-       Device -> Function -> 3D -> Render
  ;{----------------------------------------------------------
  
  Procedure.l WorldToScreen(*D3DXMATRIX.Device::D3DXMATRIX, *D3DXVECTOR3.Device::D3DXVECTOR3, *RECT.RECT, *POINT.POINT)
      Protected w.f, sx.f, sy.f, invw.f, xt.f, yt.f
      sx = *D3DXMATRIX\_11 * *D3DXVECTOR3\x + *D3DXMATRIX\_12 * *D3DXVECTOR3\y + *D3DXMATRIX\_13 * *D3DXVECTOR3\z + *D3DXMATRIX\_14
      sy = *D3DXMATRIX\_21 * *D3DXVECTOR3\x + *D3DXMATRIX\_22 * *D3DXVECTOR3\y + *D3DXMATRIX\_23 * *D3DXVECTOR3\z + *D3DXMATRIX\_24
      w =  *D3DXMATRIX\_41 * *D3DXVECTOR3\x + *D3DXMATRIX\_42 * *D3DXVECTOR3\y + *D3DXMATRIX\_43 * *D3DXVECTOR3\z + *D3DXMATRIX\_44
      If w < 0.001 : *POINT\x = 0 : *POINT\y = 0 : ProcedureReturn 0 : EndIf
      invw = 1 / w
      sx = sx * invw
      sy = sy * invw
      xt = *RECT\right / 2
      yt = *RECT\bottom / 2
      xt = xt + (0.5 * sx * *RECT\right + 0.5)
      yt = yt - (0.5 * sy * *RECT\bottom + 0.5)
      *POINT\x = xt
      *POINT\y = yt
      ProcedureReturn 1
  EndProcedure
  
  Procedure.l SpecificCamera(*hDevice.Device)
    
    Protected *matrix4x4.D3DXMATRIX = AllocateMemory(SizeOf(D3DXMATRIX))
    
    *matrix4x4\_11 = 1.0
    *matrix4x4\_12 = 0.0
    *matrix4x4\_13 = 0.0
    *matrix4x4\_14 = 0.0
    
    *matrix4x4\_21 = 0.0
    *matrix4x4\_22 = 0.0
    *matrix4x4\_23 = 1.0
    *matrix4x4\_24 = 0.0
    
    *matrix4x4\_31 = 0.0
    *matrix4x4\_32 = 1.0
    *matrix4x4\_33 = 0.0
    *matrix4x4\_34 = 0.0
    
    *matrix4x4\_41 = 0.0
    *matrix4x4\_42 = 1.0
    *matrix4x4\_43 = 0.0
    *matrix4x4\_44 = 0.0
    
    ProcedureReturn *matrix4x4
    
  EndProcedure
  
  Procedure.l CreateObjBox(*hDevice.Device, x.f, y.f, z.f, size.f, color.l)
    
    Protected *Cube3D.Cube3D = AllocateMemory(SizeOf(Cube3D))
    
    *Cube3D\color = color
    
    *Cube3D\_11\x = x
    *Cube3D\_11\y = y
    *Cube3D\_11\z = z
    
    *Cube3D\_12\x = *Cube3D\_11\x + size
    *Cube3D\_12\y = *Cube3D\_11\y
    *Cube3D\_12\z = *Cube3D\_11\z
    
    *Cube3D\_13\x = *Cube3D\_11\x + size
    *Cube3D\_13\y = *Cube3D\_11\y
    *Cube3D\_13\z = *Cube3D\_11\z + size
    
    *Cube3D\_14\x = *Cube3D\_11\x
    *Cube3D\_14\y = *Cube3D\_11\y
    *Cube3D\_14\z = *Cube3D\_11\z + size
    
    *Cube3D\_21\x = *Cube3D\_11\x
    *Cube3D\_21\y = *Cube3D\_11\y + size
    *Cube3D\_21\z = *Cube3D\_11\z
    
    *Cube3D\_22\x = *Cube3D\_11\x + size
    *Cube3D\_22\y = *Cube3D\_11\y + size
    *Cube3D\_22\z = *Cube3D\_11\z
    
    *Cube3D\_23\x = *Cube3D\_11\x + size
    *Cube3D\_23\y = *Cube3D\_11\y + size
    *Cube3D\_23\z = *Cube3D\_11\z + size
    
    *Cube3D\_24\x = *Cube3D\_11\x
    *Cube3D\_24\y = *Cube3D\_11\y + size
    *Cube3D\_24\z = *Cube3D\_11\z + size
    
    ProcedureReturn *Cube3D
    
  EndProcedure
  
  Procedure.l WorldOfObjBox(*hDevice.Device, *matrix4x4.D3DXMATRIX , *Cube3D.Cube3D)
    
  EndProcedure
  
  Procedure.l RenderObjBox(*hDevice.Device, *matrix4x4.D3DXMATRIX , *Cube3D.Cube3D, style.l = #STYLE_NONE)
    
    WorldToScreen(*matrix4x4, *Cube3D\_11, *hDevice\INFO\RECT, *Cube3D\j11)
    WorldToScreen(*matrix4x4, *Cube3D\_12, *hDevice\INFO\RECT, *Cube3D\j12)
    WorldToScreen(*matrix4x4, *Cube3D\_13, *hDevice\INFO\RECT, *Cube3D\j13)
    WorldToScreen(*matrix4x4, *Cube3D\_14, *hDevice\INFO\RECT, *Cube3D\j14)
    
    WorldToScreen(*matrix4x4, *Cube3D\_21, *hDevice\INFO\RECT, *Cube3D\j21)
    WorldToScreen(*matrix4x4, *Cube3D\_22, *hDevice\INFO\RECT, *Cube3D\j22)
    WorldToScreen(*matrix4x4, *Cube3D\_23, *hDevice\INFO\RECT, *Cube3D\j23)
    WorldToScreen(*matrix4x4, *Cube3D\_24, *hDevice\INFO\RECT, *Cube3D\j24)
    
    If *Cube3D\j11\x = 0 Or *Cube3D\j12\x = 0 Or *Cube3D\j13\x = 0 Or *Cube3D\j14\x = 0 Or *Cube3D\j21\x = 0 Or *Cube3D\j22\x = 0 Or *Cube3D\j23\x = 0 Or *Cube3D\j24\x = 0 : ProcedureReturn 0 : EndIf
    If *Cube3D\j11\x = 0 Or *Cube3D\j12\y = 0 Or *Cube3D\j13\y = 0 Or *Cube3D\j14\y = 0 Or *Cube3D\j21\y = 0 Or *Cube3D\j22\y = 0 Or *Cube3D\j23\y = 0 Or *Cube3D\j24\y = 0 : ProcedureReturn 0 : EndIf
    
    If style & #STYLE_LINE
      Device::LineA(*hDevice, *Cube3D\j21\x, *Cube3D\j21\y, *Cube3D\j22\x, *Cube3D\j22\y, *Cube3D\color)
      Device::LineA(*hDevice, *Cube3D\j22\x, *Cube3D\j22\y, *Cube3D\j23\x, *Cube3D\j23\y, *Cube3D\color)
      Device::LineA(*hDevice, *Cube3D\j23\x, *Cube3D\j23\y, *Cube3D\j24\x, *Cube3D\j24\y, *Cube3D\color)
      Device::LineA(*hDevice, *Cube3D\j24\x, *Cube3D\j24\y, *Cube3D\j21\x, *Cube3D\j21\y, *Cube3D\color)
            
      Device::LineA(*hDevice, *Cube3D\j21\x, *Cube3D\j21\y, *Cube3D\j11\x, *Cube3D\j11\y, *Cube3D\color)
      Device::LineA(*hDevice, *Cube3D\j22\x, *Cube3D\j22\y, *Cube3D\j12\x, *Cube3D\j12\y, *Cube3D\color)
      Device::LineA(*hDevice, *Cube3D\j23\x, *Cube3D\j23\y, *Cube3D\j13\x, *Cube3D\j13\y, *Cube3D\color)
      Device::LineA(*hDevice, *Cube3D\j24\x, *Cube3D\j24\y, *Cube3D\j14\x, *Cube3D\j14\y, *Cube3D\color)
      
      Device::LineA(*hDevice, *Cube3D\j11\x, *Cube3D\j11\y, *Cube3D\j12\x, *Cube3D\j12\y, *Cube3D\color)
      Device::LineA(*hDevice, *Cube3D\j12\x, *Cube3D\j12\y, *Cube3D\j13\x, *Cube3D\j13\y, *Cube3D\color)
      Device::LineA(*hDevice, *Cube3D\j13\x, *Cube3D\j13\y, *Cube3D\j14\x, *Cube3D\j14\y, *Cube3D\color)
      Device::LineA(*hDevice, *Cube3D\j14\x, *Cube3D\j14\y, *Cube3D\j11\x, *Cube3D\j11\y, *Cube3D\color)
    EndIf
    
  EndProcedure
  
  ;}----------------------------------------------------------
  ;-       Device -> DataSection -> vtDevice -> Methods 
  ;{----------------------------------------------------------
    
  Procedure.l InterfaceCreate(hWnd.l, device.l = #DEVICE_GDI, begun.l = 1, AlphaFormat.l = 32, fps.l = 30, layred.l = 0, *hDevice.Device = 0)
    Protected *this.iiDevice 
    *this = AllocateMemory(SizeOf(iiDevice))
    If *this
      *this\vt = ?vtDevice
      init()
      *this\Device = Create(hWnd.l, device.l, begun.l, AlphaFormat.l, fps.l, layred.l, *hDevice)
      ProcedureReturn *this 
    EndIf
  EndProcedure
  
  Procedure Free(*this.iiDevice)
    Close(*this\Device)
    Release()
    FreeMemory(*this) 
  EndProcedure
  
  Procedure.l iDraw(*this.iiDevice)
    ProcedureReturn Draw(*this\Device)
  EndProcedure
  
  Procedure.l iLoadImageA(*this.iiDevice, sFile.s, *hImage.IMAGE = 0)
    ProcedureReturn LoadImageA(*this\Device, sFile.s, *hImage)
  EndProcedure
  
  Procedure.l iLoadImageMemory(*this.iiDevice, pMem, bytes.l, *hImage.IMAGE = 0)
    ProcedureReturn LoadImageMemory(*this\Device, pMem, bytes.l, *hImage)
  EndProcedure
  
  Procedure.l iLoadFontA(*this.iiDevice, sName.s, size, style.l=#STYLE_QUALTY_FULL, *hFont.FONT = 0)
    ProcedureReturn LoadFontA(*this\Device, sName.s, size, style.l, *hFont.FONT)
  EndProcedure
  
  Procedure.l iReleaseFont(*this.iiDevice, *hFont.FONT)
    ProcedureReturn ReleaseFont(*this\Device, *hFont)
  EndProcedure
  
  Procedure.l iReleaseImage(*this.iiDevice, *hImage.IMAGE)
    ProcedureReturn ReleaseImage(*this\Device, *hImage)
  EndProcedure
  
  Procedure.l iFrameNext(*this.iiDevice)
    ProcedureReturn FrameNext(*this\Device)
  EndProcedure
  
  Procedure.l iOnReSize(*this.iiDevice)
    ProcedureReturn OnReSize(*this\Device)
  EndProcedure
  
  Procedure.l iOnRelease(*this.iiDevice)
    ProcedureReturn OnRelease(*this\Device)
  EndProcedure
  
  Procedure.l iOnMinimize(*this.iiDevice)
    ProcedureReturn OnMinimize(*this\Device)
  EndProcedure
  
  Procedure.l iOnMouse(*this.iiDevice)
    ProcedureReturn OnMouse(*this\Device)
  EndProcedure
  
  Procedure.l iGetMouse(*this.iiDevice, *x, *y, *point)
    ProcedureReturn GetMouse(*this\Device, *x, *y, *point)
  EndProcedure
  
  Procedure.l iSetSmoothing(*this.iiDevice, Smoothing.l = #SMOOTHING_NONE)
    ProcedureReturn SetSmoothing(*this\Device, Smoothing.l)
  EndProcedure
  
  Procedure.l iSetDrawRect(*this.iiDevice, x.l = 0, y.l = 0, w.l = 0, h.l = 0, style.l = #STYLE_NONE)
    ProcedureReturn SetDrawRect(*this\Device, x.l, y.l, w.l, h.l, style.l)
  EndProcedure
  
  Procedure.l iLoadFontB(*this.iiDevice, pMem, bytes.l)
    ProcedureReturn LoadFontB(*this\Device, pMem, bytes.l)
  EndProcedure
  
  Procedure.l iFormat(*this.iiDevice, Format.l, Value.l = 0)
    ProcedureReturn Format(*this\Device, Format.l, Value.l)
  EndProcedure
  
  Procedure.l iRect(*this.iiDevice, x.l, y.l, w.l, h.l, color.l, style.l = #STYLE_NONE)
    ProcedureReturn Rect(*this\Device, x.l, y.l, w.l, h.l, color.l, style.l)
  EndProcedure
  
  Procedure.l iRectFill(*this.iiDevice, x.l, y.l, w.l, h.l, color.l, style.l = #STYLE_NONE)
    ProcedureReturn RectFill(*this\Device, x.l, y.l, w.l, h.l, color.l, style.l)
  EndProcedure
  
  Procedure.l iLineA(*this.iiDevice, x1.l, y1.l, x2.l, y2.l, color.l, style.l = #STYLE_NONE)
    ProcedureReturn LineA(*this\Device, x1.l, y1.l, x2.l, y2.l, color.l, style.l)
  EndProcedure
  
  Procedure.l iArc(*this.iiDevice, x, y, w, h, startang, sweepang, color, style.l = #STYLE_NONE)
    ProcedureReturn Arc(*this\Device, x, y, w, h, startang, sweepang, color, style.l)
  EndProcedure
  
  Procedure.l iBezier(*this.iiDevice, x1, y1, x2, y2, x3, y3, x4, y4, color, style.l = #STYLE_NONE)
    ProcedureReturn Bezier(*this\Device, x1, y1, x2, y2, x3, y3, x4, y4, color, style.l)
  EndProcedure
  
  Procedure.l iEllipseA(*this.iiDevice, x, y, w, h, ARGB, style.l = #STYLE_NONE)
    ProcedureReturn EllipseA(*this\Device, x, y, w, h, ARGB, style.l)
  EndProcedure
  
  Procedure.l iImage(*this.iiDevice, *hImage.IMAGE, x, y, style.l = #STYLE_NONE)
    ProcedureReturn Image(*this\Device, *hImage.IMAGE, x, y, style.l)
  EndProcedure
  
  Procedure.l iImageRect(*this.iiDevice, *hImage.IMAGE, x, y, w, h, style.l = #STYLE_NONE)
    ProcedureReturn ImageRect(*this\Device, *hImage.IMAGE, x, y, w, h, style.l)
  EndProcedure

  
  ;}----------------------------------------------------------
  ;-       Device -> DataSection -> vtDevice -> InterFace
  ;{----------------------------------------------------------
  
  DataSection : vtDevice:
    Data.i @iImageRect()
    Data.i @iImage()
    Data.i @iEllipseA()
    Data.i @iBezier()
    Data.i @iArc()
    Data.i @iLineA()
    Data.i @iRectFill()
    Data.i @iRect()
    Data.i @iFormat()
    Data.i @iLoadFontB()
    Data.i @iSetDrawRect()
    Data.i @iSetSmoothing()
    Data.i @iGetMouse()
    Data.i @iOnMouse()
    Data.i @iOnMinimize()
    Data.i @iOnRelease()
    Data.i @iOnReSize()
    Data.i @iFrameNext()
    Data.i @iReleaseImage()
    Data.i @iReleaseFont()
    Data.i @iLoadFontA()
    Data.i @iLoadImageMemory()
    Data.i @iLoadImageA()
    Data.i @iDraw()
    Data.i @Free()
  EndDataSection
  
  ;}
EndModule

; #INDEX# =======================================================================================================================
; Compile .........: Компиляция движка в DLL
; ===============================================================================================================================
CompilerIf #PB_Compiler_DLL And Not #PB_Compiler_Debugger
  
  ProcedureDLL InterfaceCreate(hWnd.l, device.l = Device::#DEVICE_GDI, begun.l = 1, AlphaFormat.l = 32, fps.l = 30, layred.l = 0, *hDevice.Device::Device = 0)
    ProcedureReturn Device::InterfaceCreate(hWnd.l, device.l, begun.l, AlphaFormat.l, fps.l, layred.l, *hDevice)
  EndProcedure
  
  ProcedureDLL Init()
    ProcedureReturn Device::Init()
  EndProcedure
  
  ProcedureDLL Release()
    ProcedureReturn Device::Release()
  EndProcedure
  
  ProcedureDLL Create(hWnd.l, device.l = Device::#DEVICE_GDI, begun.l = 1, AlphaFormat.l = 32, fps.l = 30, layred.l = 0, *hDevice.Device::Device = 0)
    ProcedureReturn Device::Create(hWnd.l, device.l, begun.l, AlphaFormat.l, fps.l, layred.l, *hDevice)
  EndProcedure
  
  ProcedureDLL Close(*hDevice.Device::Device, nFree.l = 0)
    ProcedureReturn Device::Close(*hDevice, nFree.l)
  EndProcedure
  
  ProcedureDLL Draw(*hDevice.Device::Device)
    ProcedureReturn Device::Draw(*hDevice)
  EndProcedure
  
  ProcedureDLL LoadImageA(*hDevice.Device::Device, sFile.s, *hImage.Device::IMAGE = 0)
    ProcedureReturn Device::LoadImageA(*hDevice, sFile.s, *hImage)
  EndProcedure
  
  ProcedureDLL LoadImageMemory(*hDevice.Device::Device, pMem, bytes.l, *hImage.Device::IMAGE = 0)
    ProcedureReturn Device::LoadImageMemory(*hDevice, pMem, bytes, *hImage)
  EndProcedure
  
  ProcedureDLL ReleaseImage(*hDevice.Device::Device, *hImage.Device::IMAGE)
    ProcedureReturn Device::ReleaseImage(*hDevice, *hImage)
  EndProcedure
  
  ProcedureDLL LoadFontA(*hDevice.Device::Device, sName.s, size, style.l=0, *hFont.Device::FONT = 0)
    ProcedureReturn Device::LoadFontA(*hDevice, sName.s, size, style.l, *hFont)
  EndProcedure
  
  ProcedureDLL ReleaseFont(*hDevice.Device::Device, *hFont.Device::FONT)
    ProcedureReturn Device::ReleaseFont(*hDevice, *hFont)
  EndProcedure
  
  ProcedureDLL FrameNext(*hDevice.Device::Device)
    ProcedureReturn Device::FrameNext(*hDevice)
  EndProcedure
  
  ProcedureDLL GetMouse(*hDevice.Device::Device, *x, *y, *point)
    ProcedureReturn Device::GetMouse(*hDevice, *x, *y, *point)
  EndProcedure
  
  ProcedureDLL SetSmoothing(*hDevice.Device::Device, Smoothing.l = Device::#SMOOTHING_NONE)
    ProcedureReturn Device::SetSmoothing(*hDevice, Smoothing.l)
  EndProcedure
  
  ProcedureDLL SetDrawRect(*hDevice.Device::Device, x.l = 0, y.l = 0, w.l = 0, h.l = 0, style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::SetDrawRect(*hDevice, x, y, w, h, style)
  EndProcedure
  
  ProcedureDLL OnReSize(*hDevice.Device::Device)
    ProcedureReturn Device::OnReSize(*hDevice)
  EndProcedure
  
  ProcedureDLL OnRelease(*hDevice.Device::Device)
    ProcedureReturn Device::OnRelease(*hDevice)
  EndProcedure
  
  ProcedureDLL OnMinimize(*hDevice.Device::Device)
    ProcedureReturn Device::OnMinimize(*hDevice)
  EndProcedure
  
  ProcedureDLL OnMouse(*hDevice.Device::Device)
    ProcedureReturn Device::OnMouse(*hDevice)
  EndProcedure
   
  ProcedureDLL Rect(*hDevice.Device::Device, x.l, y.l, w.l, h.l, color.l, style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::Rect(*hDevice, x.l, y.l, w.l, h.l, color.l, style.l)
  EndProcedure
  
  ProcedureDLL RectFill(*hDevice.Device::Device, x.l, y.l, w.l, h.l, color.l, style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::RectFill(*hDevice, x.l, y.l, w.l, h.l, color.l, style.l)
  EndProcedure
  
  ProcedureDLL LineA(*hDevice.Device::Device, x1.l, y1.l, x2.l, y2.l, color.l, style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::LineA(*hDevice, x1.l, y1.l, x2.l, y2.l, color.l, style.l)
  EndProcedure
  
  ProcedureDLL Arc(*hDevice.Device::Device, x, y, w, h, startang, sweepang, color, style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::Arc(*hDevice, x, y, w, h, startang, sweepang, color, style.l)
  EndProcedure
  
  ProcedureDLL Bezier(*hDevice.Device::Device, x1, y1, x2, y2, x3, y3, x4, y4, color, style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::Bezier(*hDevice, x1, y1, x2, y2, x3, y3, x4, y4, color, style.l)
  EndProcedure
  
  ProcedureDLL EllipseA(*hDevice.Device::Device, x, y, w, h, ARGB, style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::EllipseA(*hDevice, x, y, w, h, ARGB, style.l)
  EndProcedure
  
  ProcedureDLL EllipseFill(*hDevice.Device::Device, x, y, w, h, ARGB, style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::EllipseFill(*hDevice, x, y, w, h, ARGB, style.l)
  EndProcedure
  
  ProcedureDLL Image(*hDevice.Device::Device, *hImage.Device::IMAGE, x, y, style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::Image(*hDevice, *hImage, x, y, style.l)
  EndProcedure
  
  ProcedureDLL ImageRect(*hDevice.Device::Device, *hImage.Device::IMAGE, x, y, w, h, style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::ImageRect(*hDevice, *hImage, x, y, w, h, style.l)
  EndProcedure
  
  ProcedureDLL ImageRectA(*hDevice.Device::Device, *hImage.Device::IMAGE, x, y, x2, y2, w, h, style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::ImageRectA(*hDevice, *hImage, x, y, x2, y2, w, h, style.l)
  EndProcedure
  
  ProcedureDLL Pie(*hDevice.Device::Device, x, y, w, h, startang, sweepang, ARGB, style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::Pie(*hDevice, x, y, w, h, startang, sweepang, ARGB, style.l)
  EndProcedure
  
  ProcedureDLL PieFill(*hDevice.Device::Device, x, y, w, h, startang, sweepang, ARGB, style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::PieFill(*hDevice, x, y, w, h, startang, sweepang, ARGB, style.l)
  EndProcedure
  
  ProcedureDLL StringEx(*hDevice.Device::Device, *hFont.Device::FONT, text.s, x.l, y.l, w.l, h.l, ARGB, style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::StringEx(*hDevice, *hFont, text.s, x.l, y.l, w.l, h.l, ARGB, style.l)
  EndProcedure
  
  ProcedureDLL String(*hDevice.Device::Device, text.s, x.l, y.l, w.l, h.l, ARGB, font.s = "Arial", size = 10, style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::String(*hDevice, text.s, x.l, y.l, w.l, h.l, ARGB, font.s, size, style.l)
  EndProcedure
  
  ProcedureDLL Clear(*hDevice.Device::Device, ARGB)
    ProcedureReturn Device::Clear(*hDevice, ARGB)
  EndProcedure
  
  ProcedureDLL UIButton(*hDevice.Device::Device, *ptr1, *ptr2, *ptr3, x.l, y.l, w.l, h.l, style.l = Device::#UI_STYLE_IMAGE, wstyle.l = Device::#STYLE_NONE)
    ProcedureReturn Device::UIButton(*hDevice, *ptr1, *ptr2, *ptr3, x, y, w, h, style, wstyle)
  EndProcedure
  ;-
  ProcedureDLL LoadFontB(*hDevice.Device::Device, pMem, bytes.l)
    ProcedureReturn Device::LoadFontB(*hDevice, pMem, bytes.l)
  EndProcedure
  
  ProcedureDLL ImageSetRotateFlip(*hDevice.Device::Device, *hImage.Device::IMAGE, iRotateFlip.i)
    ProcedureReturn Device::ImageSetRotateFlip(*hDevice, *hImage, iRotateFlip.i)
  EndProcedure
  
  ProcedureDLL CircleA(*hDevice.Device::Device, x, y, radius, ARGB, style.l = Device::#STYLE_NONE)
    ProcedureReturn CircleA(*hDevice, x, y, radius, ARGB, style.l)
  EndProcedure
  
  ProcedureDLL UInputCreate(*hDevice.Device::Device, nfont.s, sfont.l, UIStyle.l = Device::#INPUT_DEFAUT, text.s = "", placehold.s = "")
    ProcedureReturn Device::UInputCreate(*hDevice, nfont.s, sfont.l, UIStyle.l, text.s, placehold.s)
  EndProcedure
  
  ProcedureDLL UInputClose(*hDevice.Device::Device, *hUInput.Device::UInput)
    ProcedureReturn Device::UInputClose(*hDevice, *hUInput)
  EndProcedure
  
  ProcedureDLL UInputOnRelease(*hDevice.Device::Device, *hUInput.Device::UInput)
    ProcedureReturn Device::UInputOnRelease(*hDevice, *hUInput)
  EndProcedure
  
  ProcedureDLL UInputDraw(*hDevice.Device::Device, *hUInput.Device::UInput, x.l, y.l, w.l, h.l, Style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::UInputDraw(*hDevice, *hUInput, x.l, y.l, w.l, h.l, Style.l)
  EndProcedure
  
  ProcedureDLL OnUInput(*hDevice.Device::Device, *hUInput.Device::UInput, event.l, wParam.l = -1)
    ProcedureReturn Device::OnUInput(*hDevice, *hUInput, event.l, wParam.l)
  EndProcedure
  
  ProcedureDLL CreateScrollRegion(*hDevice.Device::Device, x.l, y.l, w.l, h.l, scroll.l = 1, region.l = 1, speed_end.l = 3, speed.l = 10, type.l = 0, style.l = Device::#STYLE_NONE, scroll_back.l = $10000000, scroll_color.l = $40000000)
    ProcedureReturn Device::CreateScrollRegion(*hDevice, x.l, y.l, w.l, h.l, scroll.l, region.l, speed_end.l, speed.l, type.l, style.l, scroll_back.l, scroll_color.l)
  EndProcedure
  
  ProcedureDLL ScrollBegin(*hDevice.Device::Device, *hScroll.Device::SCROLL)
    ProcedureReturn Device::ScrollBegin(*hDevice, *hScroll)
  EndProcedure
  
  ProcedureDLL ScrollEnd(*hDevice.Device::Device, *hScroll.Device::SCROLL, Max.l)
    ProcedureReturn Device::ScrollEnd(*hDevice, *hScroll, Max.l)
  EndProcedure
  
  ProcedureDLL GetScroll(*hDevice.Device::Device, *hScroll.Device::SCROLL)
    ProcedureReturn Device::GetScroll(*hDevice, *hScroll)
  EndProcedure
  
  ProcedureDLL GetScrollCount(*hDevice.Device::Device, *hScroll.Device::SCROLL)
    ProcedureReturn Device::GetScrollCount(*hDevice, *hScroll)
  EndProcedure
  
  ProcedureDLL OnScroll(*hDevice.Device::Device, *hScroll.Device::SCROLL, event.l, wParam.l = 0)
    ProcedureReturn Device::OnScroll(*hDevice, *hScroll, event.l, wParam.l)
  EndProcedure
  
  ProcedureDLL SetScrollRegion(*hDevice.Device::Device, *hScroll.Device::SCROLL, x.l, y.l, w.l, h.l, style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::SetScrollRegion(*hDevice, *hScroll, x.l, y.l, w.l, h.l, style.l)
  EndProcedure
  
  ProcedureDLL ResetScroll(*hDevice.Device::Device, *hScroll.Device::SCROLL)
    ProcedureReturn Device::ResetScroll(*hDevice, *hScroll)
  EndProcedure
  
  ProcedureDLL StringCRLF(*hDevice.Device::Device, *hFont.Device::FONT, text.s, x.l, y.l, w.l, h.l, ARGB, style.l = Device::#STYLE_NONE, interval.l = 25, line.l = $FFFF, Delimiter.s = "\r", style_d.l = 0)
    ProcedureReturn Device::StringCRLF(*hDevice, *hFont, text.s, x.l, y.l, w.l, h.l, ARGB, style.l, interval.l, line.l, Delimiter.s, style_d.l)
  EndProcedure
  
  ProcedureDLL StringLine(*hDevice.Device::Device, text.s, line.l = $FFFF, Delimiter.s = "\r")
    ProcedureReturn Device::StringLine(*hDevice, text.s, line.l, Delimiter.s)
  EndProcedure
  
  ProcedureDLL StringInfoW(*hDevice.Device::Device, *hFont.Device::FONT, text.s)
    ProcedureReturn Device::StringInfoW(*hDevice, *hFont, text.s)
  EndProcedure
  
  ProcedureDLL StringInfoH(*hDevice.Device::Device, *hFont.Device::FONT, text.s)
    ProcedureReturn StringInfoH(*hDevice, *hFont, text.s)
  EndProcedure
  
  ProcedureDLL StringInfoFONT(*hDevice.Device::Device, *hFont.Device::FONT, text.s)
    ProcedureReturn Device::StringInfoFONT(*hDevice, *hFont, text.s)
  EndProcedure
  
  ProcedureDLL UIBarChartCreateStructColumn(*hDevice.Device::Device, nfont.s = "Arial", sfont.l = 9)
    ProcedureReturn Device::UIBarChartCreateStructColumn(*hDevice, nfont.s, sfont.l)
  EndProcedure
  
  ProcedureDLL UIBarChartReleaseStruct(*hDevice.Device::Device, *hUIBarChart.Device::UIBarChart)
    ProcedureReturn Device::UIBarChartReleaseStruct(*hDevice, *hUIBarChart)
  EndProcedure
  
  ProcedureDLL UIBarChartAddColumn(*hDevice.Device::Device, *hUIBarChart.Device::UIBarChart, size.l, Name.s = "", color.l = 0)
    ProcedureReturn Device::UIBarChartAddColumn(*hDevice, *hUIBarChart, size.l, Name.s, color.l)
  EndProcedure
  
  ProcedureDLL UIBarChartEditColunm(*hDevice.Device::Device, *hUIBarChart.Device::UIBarChart, ID.l, size.l, Name.s = "", color.l = 0)
    ProcedureReturn Device::UIBarChartEditColunm(*hDevice, *hUIBarChart, ID.l, size.l, Name.s, color.l)
  EndProcedure
  
  ProcedureDLL UIBarChartDraw(*hDevice.Device::Device, *hUIBarChart.Device::UIBarChart, x.l, y.l, w.l, h.l, style.l = Device::#STYLE_NONE)
    ProcedureReturn Device::UIBarChartDraw(*hDevice, *hUIBarChart, x.l, y.l, w.l, h.l, style.l)
  EndProcedure
  
  ProcedureDLL UIChartOnRelease(*hDevice.Device::Device, *hUIBarChart.Device::UIBarChart)
    ProcedureReturn Device::UIChartOnRelease(*hDevice, *hUIBarChart)
  EndProcedure
    
CompilerEndIf

; IDE Options = PureBasic 5.50 (Windows - x86)
; ExecutableFormat = Shared dll
; CursorPosition = 2058
; FirstLine = 97
; Folding = CgAABQQAAAiA5BgLeZ0w5AK5v---0e-e-+
; EnableThread
; EnableXP
; Executable = Bin\Device.dll