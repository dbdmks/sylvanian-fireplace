set table 'out_candle.dat'
set key autotitle columnheader
set samples 2000
plot [0:2000] 'manual.dat' using 1:2 smooth mcspline title at beginning,\
'manual.dat' using 1:3 smooth mcspline
unset table
unset samples
set xtics 30 out rotate
set grid back
plot [0:] [0:100] 'candle.dat' u ($1):($2) ps 2 pt 6 lc rgb "red",\
'candle.dat' u ($1):($3) ps 2 pt 6 lc rgb "blue",\
'out_candle.dat' i 0 u ($1):($2) with steps lc rgb "red" lw 5 title "LEFT",\
'out_candle.dat' i 1 u ($1):($2) with steps lc rgb "blue" lw 1 title "TOP"
