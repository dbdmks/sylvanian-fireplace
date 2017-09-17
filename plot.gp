round(x) = x-floor(x) < 0.5 ? floor(x) : ceil(x)
variate(x) = round(rand(0)*100) % x ? 1 : 0
set table 'out_candle.dat'
set key autotitle columnheader
set samples 2000
#plot [1:2000] 20*sin(x/15)+(5+2*rand(0))*sin(x+30)+50,\
#rand(0)<0.0 ? 100 : rand(0)*40 + 20*sin(x+rand(0))+20 smooth mcspline title at beginning
plot [1:2000] 20*sin(x/20+5*variate(33)*sin(x/12))+70 smooth mcspline title at beginning,\
variate(50) == 0? 100 : rand(0)*40 + 20*sin(x+rand(0))+20 smooth mcspline title at beginning
 
unset table
unset samples
set xtics 30 out rotate
set grid back
plot [0:] [0:100] 'out_candle.dat' i 0 u ($1):($2) with steps lc rgb "red" lw 1 title "LEFT",\
'out_candle.dat' i 1 u ($1):($2) with steps lc rgb "blue" lw 1 title "TOP"
