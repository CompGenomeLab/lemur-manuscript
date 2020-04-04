#!/bin/bash

defFile="output/manuscript.pdf"
main="${defFile%.pdf}-main.pdf"
supp="${defFile%.pdf}-supp.pdf"

pdftk $defFile cat 1-28 output ${main}
pdftk $defFile cat 29-33 output ${supp}

input=${main}
output="${input%.pdf}-num.pdf"
pagenum=$(pdftk "$input" dump_data | grep "NumberOfPages" | cut -d":" -f2)
enscript -L1 --header='|| $%/$=' --output - < <(for i in $(seq "$pagenum"); do echo; done) | ps2pdf - | pdftk "$input" multistamp - output $output

input=${supp}
output="${input%.pdf}-num.pdf"
pagenum=$(pdftk "$input" dump_data | grep "NumberOfPages" | cut -d":" -f2)
enscript -L1 --header='|| $%/$=' --output - < <(for i in $(seq "$pagenum"); do echo; done) | ps2pdf - | pdftk "$input" multistamp - output $output

