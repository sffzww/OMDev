@change # %1 %2 %3 %4 %5 < Script.mok > Script.tmp
@if errorlevel 1 goto syntax
  @call moca13 -q Script.tmp
  @goto end

:syntax
  @echo Moca-FT : Syntax error
  @echo Usage : Moca-FT [input] [output] [duration] [step] [stories]

:end
  @del Script.tmp
