;bx should hold number of kanji in font
;cx should hold x-pixel
;dx should hold y-pixel

  subkanjisegment dw 0

; subkanjifontname db 'kanji16.bit',0
  subkanjifontname db 'jis.16',0

  subkanjifonthandle dw 0
