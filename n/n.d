;n.d   data
;n05   prestart, check for 'x' in command tail
;n10   puts font into memory
;n15   sets screen to vga
;n20   counts how many files are in the ichi, ni, san subdirectories
;n25   start, clear screen
;n30   chooses which directory to get tango from, searches for correct tango
;n40   opens the tango file, moves information to thedata, closes tango file
;n50   displays the kanji
;n65   get pronunciation
;n70   check pronunciation
;n80   get definition, check if word is known, rename, loop back to top
;n90   ends, thedata


  jmp prestart

jasciioffset equ 00bch
hiraganaoffset equ 011ah
katakanaoffset equ 0178h
kanji1offset equ 0292h

;n05
  xstatus db 0

;n20
  xpath db "x\"
  ichipath db "ichi\"
  nipath db "ni\"
  sanpath db "san\"
  wildtan db "*.tan",0
  tangopath db "tango\"
  tangoname db 30 dup 0
  tangofilehandle dw 0
  nfichi dw 0
  nfni dw 0
  nfsan dw 0

;n30
  level db 0
  nf dw 0
  allzeroes db 0

;n65
  pronuninput db 'What is the pronunciation?',53 dup 020h,'$'
  prepronun db 70,0
  pronun db 70 dup 0
  blankline db 79 dup 020h,'$'

;n70
  failcheck db 0
  pronuncorrect db   'That is correct!',63 dup 020h,'$'
  pronunincorrect db 'That is incorrect.',61 dup 020h,'$'
  givecorrectpronun db 'The correct pronunciation is ','$'

;n80
  knowtangoka db 'Do you know this word?  (space for no)',39 dup 0,'$'
  oldtangopath db 'tango\'
  oldtangoname db 30 dup 0
  dontjump db 0

;n90
  copyingfiles db 'Please wait, copying files...','$'
