## Sylvanian fireplace LED mod. ##

A controller to save battery in the [Sylvanian Families fireplace][1]

It originally uses small incandescent lamp and simple slide switch. 
This leads to battery is completely depleted it 1 day if you have forget to turn it off.

I have changed this small incandecent to 3 ultrabright warm white LEDs and added:
- step-up converter (5V though, the one I had by hand, use 3.3V if you have a choice, for a better efficiency)
- STM8 controller (small STM8S103F3P9 board from Aliexpress)
- 3pcs 100ohm resistors
- peice of bluetack

The device runs at high brightness emulating burning fire for 30 minutes.
After this top LED light is dimmed.
Then both bottom LEDs are dimmed for 15minutes until weak glow, 
which will then be disabled completely and uC put into halt mode.

There are binary `sfp.s19` and `option_bytes.hex` files in the release directory, you also can use `sft_programmer.stp` file to just flash the firmware.

If you wish to generate your own brightness curves - use the Gnuplot: `gnuplot -c plot.gp` which will create `out_candle.dat`, then run `convert.pl` perl script to convert this into `pwm_waves.h` header file.

[1]:http://sylvanianfamilies.net/uk/catalog/item_detail.php?product_id=572
