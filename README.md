## Sylvanian fireplace LED mod. ##

A controller to save battery in the [Sylvanian Families fireplace][1]

It originally uses small incandescent lamp and simple slide switch. 
This leads to battery is completely depleted it 1 day if you have forget to turn it off.

I have changed this small incandecent to 3 ultrabright warm white LEDs and added:
- step-up converter (5V though, the one I had by hand, use 3.3V if you have a choice, for a better efficiency)
- STM8 controller (small STM8S103F3P9 board from Aliexpress)
- 3pcs 100ohm resistors
- peice of bluetack to get rid of white light coming out between the fire and bottom of the fireplace

[Here][6] is the layout of components inside the fireplace.

The device runs at [high brightness][2] flickering and emulating burning fire for 30 minutes.
After this top LED light is [dimmed][3] for 1.5 minutes until off.
Then both bottom LEDs are dimmed for 15 minutes to constant [weak glow][4], 
which will then be [disabled completely][5] and uC put into halt mode consuming less than 1mA.

There are binary `sfp.s19` and `option_bytes.hex` files in the `Release` directory, you also can use `sft_programmer.stp` file to just flash the firmware.

If you wish to generate your own brightness curves - use the Gnuplot: `gnuplot -c plot.gp` which will create `out_candle.dat`, then run `convert.pl` perl script to convert this into `pwm_waves.h` header file.

There's also `candle.gp` gnuplot file which can be used to generate smooth splines through points from `manual.dat`. But it's either too slow to look like a fire or too many points should be added to the file manually.

---
### A video how it looks like: ###
[![preview video](http://img.youtube.com/vi/3CJmpJ_zcQg/0.jpg)](http://www.youtube.com/watch?v=3CJmpJ_zcQg)


[1]:http://sylvanianfamilies.net/uk/catalog/item_detail.php?product_id=572
[2]:images/3led1.6v.jpg
[3]:images/2leds1.6v.jpg
[4]:images/2leds_glow1.6v.jpg 
[5]:images/sleeping.jpg
[6]:images/layout.jpg
