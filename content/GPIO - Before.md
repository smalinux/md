```
cd /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single

```

#### $ cat gpio-ranges
```
GPIO ranges handled:
0: gpio-0-31 GPIOS [0 - 7] PINS [82 - 89]
8: gpio-0-31 GPIOS [8 - 11] PINS [52 - 55]
12: gpio-0-31 GPIOS [12 - 15] PINS [94 - 97]
16: gpio-0-31 GPIOS [16 - 17] PINS [71 - 72]
18: gpio-0-31 GPIOS [18 - 18] PINS [135 - 135]
19: gpio-0-31 GPIOS [19 - 20] PINS [108 - 109]
21: gpio-0-31 GPIOS [21 - 21] PINS [73 - 73]
22: gpio-0-31 GPIOS [22 - 23] PINS [8 - 9]
26: gpio-0-31 GPIOS [26 - 27] PINS [10 - 11]
28: gpio-0-31 GPIOS [28 - 28] PINS [74 - 74]
29: gpio-0-31 GPIOS [29 - 29] PINS [81 - 81]
30: gpio-0-31 GPIOS [30 - 31] PINS [28 - 29]
0: gpio-32-63 GPIOS [32 - 39] PINS [0 - 7]
8: gpio-32-63 GPIOS [40 - 43] PINS [90 - 93]
12: gpio-32-63 GPIOS [44 - 59] PINS [12 - 27]
28: gpio-32-63 GPIOS [60 - 63] PINS [30 - 33]
0: gpio-64-95 GPIOS [64 - 81] PINS [34 - 51]
18: gpio-64-95 GPIOS [82 - 85] PINS [77 - 80]
22: gpio-64-95 GPIOS [86 - 95] PINS [56 - 65]
0: gpio-96-127 GPIOS [96 - 100] PINS [66 - 70]
5: gpio-96-127 GPIOS [101 - 102] PINS [98 - 99]
7: gpio-96-127 GPIOS [103 - 104] PINS [75 - 76]
13: gpio-96-127 GPIOS [109 - 109] PINS [141 - 141]
14: gpio-96-127 GPIOS [110 - 117] PINS [100 - 107]
```

#### $ cat pingroups
```
registered pin groups:
group: pinmux_uart0_pins
pin 92 (PIN92)
pin 93 (PIN93)

group: pinmux_P8_07_default_pin
pin 36 (PIN36)

group: pinmux_P8_07_gpio_pin
pin 36 (PIN36)

group: pinmux_P8_07_gpio_pu_pin
pin 36 (PIN36)

group: pinmux_P8_07_gpio_pd_pin
pin 36 (PIN36)

group: pinmux_P8_07_timer_pin
pin 36 (PIN36)

group: pinmux_P8_08_default_pin
pin 37 (PIN37)

group: pinmux_P8_08_gpio_pin
pin 37 (PIN37)

group: pinmux_P8_08_gpio_pu_pin
pin 37 (PIN37)

group: pinmux_P8_08_gpio_pd_pin
pin 37 (PIN37)

group: pinmux_P8_08_timer_pin
pin 37 (PIN37)

group: pinmux_P8_09_default_pin
pin 39 (PIN39)

group: pinmux_P8_09_gpio_pin
pin 39 (PIN39)

group: pinmux_P8_09_gpio_pu_pin
pin 39 (PIN39)

group: pinmux_P8_09_gpio_pd_pin
pin 39 (PIN39)

group: pinmux_P8_09_timer_pin
pin 39 (PIN39)

group: pinmux_P8_10_default_pin
pin 38 (PIN38)

group: pinmux_P8_10_gpio_pin
pin 38 (PIN38)

group: pinmux_P8_10_gpio_pu_pin
pin 38 (PIN38)

group: pinmux_P8_10_gpio_pd_pin
pin 38 (PIN38)

group: pinmux_P8_10_timer_pin
pin 38 (PIN38)

group: pinmux_P8_11_default_pin
pin 13 (PIN13)

group: pinmux_P8_11_gpio_pin
pin 13 (PIN13)

group: pinmux_P8_11_gpio_pu_pin
pin 13 (PIN13)

group: pinmux_P8_11_gpio_pd_pin
pin 13 (PIN13)

group: pinmux_P8_11_eqep_pin
pin 13 (PIN13)

group: pinmux_P8_11_pruout_pin
pin 13 (PIN13)

group: pinmux_P8_12_default_pin
pin 12 (PIN12)

group: pinmux_P8_12_gpio_pin
pin 12 (PIN12)

group: pinmux_P8_12_gpio_pu_pin
pin 12 (PIN12)

group: pinmux_P8_12_gpio_pd_pin
pin 12 (PIN12)

group: pinmux_P8_12_eqep_pin
pin 12 (PIN12)

group: pinmux_P8_12_pruout_pin
pin 12 (PIN12)

group: pinmux_P8_13_default_pin
pin 9 (PIN9)

group: pinmux_P8_13_gpio_pin
pin 9 (PIN9)

group: pinmux_P8_13_gpio_pu_pin
pin 9 (PIN9)

group: pinmux_P8_13_gpio_pd_pin
pin 9 (PIN9)

group: pinmux_P8_13_pwm_pin
pin 9 (PIN9)

group: pinmux_P8_14_default_pin
pin 10 (PIN10)

group: pinmux_P8_14_gpio_pin
pin 10 (PIN10)

group: pinmux_P8_14_gpio_pu_pin
pin 10 (PIN10)

group: pinmux_P8_14_gpio_pd_pin
pin 10 (PIN10)

group: pinmux_P8_14_pwm_pin
pin 10 (PIN10)

group: pinmux_P8_15_default_pin
pin 15 (PIN15)

group: pinmux_P8_15_gpio_pin
pin 15 (PIN15)

group: pinmux_P8_15_gpio_pu_pin
pin 15 (PIN15)

group: pinmux_P8_15_gpio_pd_pin
pin 15 (PIN15)

group: pinmux_P8_15_eqep_pin
pin 15 (PIN15)

group: pinmux_P8_15_pru_ecap_pwm_pin
pin 15 (PIN15)

group: pinmux_P8_15_pruin_pin
pin 15 (PIN15)

group: pinmux_P8_16_default_pin
pin 14 (PIN14)

group: pinmux_P8_16_gpio_pin
pin 14 (PIN14)

group: pinmux_P8_16_gpio_pu_pin
pin 14 (PIN14)

group: pinmux_P8_16_gpio_pd_pin
pin 14 (PIN14)

group: pinmux_P8_16_eqep_pin
pin 14 (PIN14)

group: pinmux_P8_16_pruin_pin
pin 14 (PIN14)

group: pinmux_P8_17_default_pin
pin 11 (PIN11)

group: pinmux_P8_17_gpio_pin
pin 11 (PIN11)

group: pinmux_P8_17_gpio_pu_pin
pin 11 (PIN11)

group: pinmux_P8_17_gpio_pd_pin
pin 11 (PIN11)

group: pinmux_P8_17_pwm_pin
pin 11 (PIN11)

group: pinmux_P8_18_default_pin
pin 35 (PIN35)

group: pinmux_P8_18_gpio_pin
pin 35 (PIN35)

group: pinmux_P8_18_gpio_pu_pin
pin 35 (PIN35)

group: pinmux_P8_18_gpio_pd_pin
pin 35 (PIN35)

group: pinmux_P8_19_default_pin
pin 8 (PIN8)

group: pinmux_P8_19_gpio_pin
pin 8 (PIN8)

group: pinmux_P8_19_gpio_pu_pin
pin 8 (PIN8)

group: pinmux_P8_19_gpio_pd_pin
pin 8 (PIN8)

group: pinmux_P8_19_pwm_pin
pin 8 (PIN8)

group: pinmux_P8_26_default_pin
pin 31 (PIN31)

group: pinmux_P8_26_gpio_pin
pin 31 (PIN31)

group: pinmux_P8_26_gpio_pu_pin
pin 31 (PIN31)

group: pinmux_P8_26_gpio_pd_pin
pin 31 (PIN31)

group: pinmux_P9_11_default_pin
pin 28 (PIN28)

group: pinmux_P9_11_gpio_pin
pin 28 (PIN28)

group: pinmux_P9_11_gpio_pu_pin
pin 28 (PIN28)

group: pinmux_P9_11_gpio_pd_pin
pin 28 (PIN28)

group: pinmux_P9_11_uart_pin
pin 28 (PIN28)

group: pinmux_P9_12_default_pin
pin 30 (PIN30)

group: pinmux_P9_12_gpio_pin
pin 30 (PIN30)

group: pinmux_P9_12_gpio_pu_pin
pin 30 (PIN30)

group: pinmux_P9_12_gpio_pd_pin
pin 30 (PIN30)

group: pinmux_P9_13_default_pin
pin 29 (PIN29)

group: pinmux_P9_13_gpio_pin
pin 29 (PIN29)

group: pinmux_P9_13_gpio_pu_pin
pin 29 (PIN29)

group: pinmux_P9_13_gpio_pd_pin
pin 29 (PIN29)

group: pinmux_P9_13_uart_pin
pin 29 (PIN29)

group: pinmux_P9_14_default_pin
pin 18 (PIN18)

group: pinmux_P9_14_gpio_pin
pin 18 (PIN18)

group: pinmux_P9_14_gpio_pu_pin
pin 18 (PIN18)

group: pinmux_P9_14_gpio_pd_pin
pin 18 (PIN18)

group: pinmux_P9_14_pwm_pin
pin 18 (PIN18)

group: pinmux_P9_15_default_pin
pin 16 (PIN16)

group: pinmux_P9_15_gpio_pin
pin 16 (PIN16)

group: pinmux_P9_15_gpio_pu_pin
pin 16 (PIN16)

group: pinmux_P9_15_gpio_pd_pin
pin 16 (PIN16)

group: pinmux_P9_15_pwm_pin
pin 16 (PIN16)

group: pinmux_P9_16_default_pin
pin 19 (PIN19)

group: pinmux_P9_16_gpio_pin
pin 19 (PIN19)

group: pinmux_P9_16_gpio_pu_pin
pin 19 (PIN19)

group: pinmux_P9_16_gpio_pd_pin
pin 19 (PIN19)

group: pinmux_P9_16_pwm_pin
pin 19 (PIN19)

group: pinmux_P9_17_default_pin
pin 87 (PIN87)

group: pinmux_P9_17_gpio_pin
pin 87 (PIN87)

group: pinmux_P9_17_gpio_pu_pin
pin 87 (PIN87)

group: pinmux_P9_17_gpio_pd_pin
pin 87 (PIN87)

group: pinmux_P9_17_spi_cs_pin
pin 87 (PIN87)

group: pinmux_P9_17_i2c_pin
pin 87 (PIN87)

group: pinmux_P9_17_pwm_pin
pin 87 (PIN87)

group: pinmux_P9_17_pru_uart_pin
pin 87 (PIN87)

group: pinmux_P9_18_default_pin
pin 86 (PIN86)

group: pinmux_P9_18_gpio_pin
pin 86 (PIN86)

group: pinmux_P9_18_gpio_pu_pin
pin 86 (PIN86)

group: pinmux_P9_18_gpio_pd_pin
pin 86 (PIN86)

group: pinmux_P9_18_spi_pin
pin 86 (PIN86)

group: pinmux_P9_18_i2c_pin
pin 86 (PIN86)

group: pinmux_P9_18_pwm_pin
pin 86 (PIN86)

group: pinmux_P9_18_pru_uart_pin
pin 86 (PIN86)

group: pinmux_P9_19_default_pin
pin 95 (PIN95)

group: pinmux_P9_19_gpio_pin
pin 95 (PIN95)

group: pinmux_P9_19_gpio_pu_pin
pin 95 (PIN95)

group: pinmux_P9_19_gpio_pd_pin
pin 95 (PIN95)

group: pinmux_P9_19_spi_cs_pin
pin 95 (PIN95)

group: pinmux_P9_19_can_pin
pin 95 (PIN95)

group: pinmux_P9_19_i2c_pin
pin 95 (PIN95)

group: pinmux_P9_19_pru_uart_pin
pin 95 (PIN95)

group: pinmux_P9_19_timer_pin
pin 95 (PIN95)

group: pinmux_P9_20_default_pin
pin 94 (PIN94)

group: pinmux_P9_20_gpio_pin
pin 94 (PIN94)

group: pinmux_P9_20_gpio_pu_pin
pin 94 (PIN94)

group: pinmux_P9_20_gpio_pd_pin
pin 94 (PIN94)

group: pinmux_P9_20_spi_cs_pin
pin 94 (PIN94)

group: pinmux_P9_20_can_pin
pin 94 (PIN94)

group: pinmux_P9_20_i2c_pin
pin 94 (PIN94)

group: pinmux_P9_20_pru_uart_pin
pin 94 (PIN94)

group: pinmux_P9_20_timer_pin
pin 94 (PIN94)

group: pinmux_P9_21_default_pin
pin 85 (PIN85)

group: pinmux_P9_21_gpio_pin
pin 85 (PIN85)

group: pinmux_P9_21_gpio_pu_pin
pin 85 (PIN85)

group: pinmux_P9_21_gpio_pd_pin
pin 85 (PIN85)

group: pinmux_P9_21_spi_pin
pin 85 (PIN85)

group: pinmux_P9_21_uart_pin
pin 85 (PIN85)

group: pinmux_P9_21_i2c_pin
pin 85 (PIN85)

group: pinmux_P9_21_pwm_pin
pin 85 (PIN85)

group: pinmux_P9_21_pru_uart_pin
pin 85 (PIN85)

group: pinmux_P9_22_default_pin
pin 84 (PIN84)

group: pinmux_P9_22_gpio_pin
pin 84 (PIN84)

group: pinmux_P9_22_gpio_pu_pin
pin 84 (PIN84)

group: pinmux_P9_22_gpio_pd_pin
pin 84 (PIN84)

group: pinmux_P9_22_spi_sclk_pin
pin 84 (PIN84)

group: pinmux_P9_22_uart_pin
pin 84 (PIN84)

group: pinmux_P9_22_i2c_pin
pin 84 (PIN84)

group: pinmux_P9_22_pwm_pin
pin 84 (PIN84)

group: pinmux_P9_22_pru_uart_pin
pin 84 (PIN84)

group: pinmux_P9_23_default_pin
pin 17 (PIN17)

group: pinmux_P9_23_gpio_pin
pin 17 (PIN17)

group: pinmux_P9_23_gpio_pu_pin
pin 17 (PIN17)

group: pinmux_P9_23_gpio_pd_pin
pin 17 (PIN17)

group: pinmux_P9_23_pwm_pin
pin 17 (PIN17)

group: pinmux_P9_24_default_pin
pin 97 (PIN97)

group: pinmux_P9_24_gpio_pin
pin 97 (PIN97)

group: pinmux_P9_24_gpio_pu_pin
pin 97 (PIN97)

group: pinmux_P9_24_gpio_pd_pin
pin 97 (PIN97)

group: pinmux_P9_24_uart_pin
pin 97 (PIN97)

group: pinmux_P9_24_can_pin
pin 97 (PIN97)

group: pinmux_P9_24_i2c_pin
pin 97 (PIN97)

group: pinmux_P9_24_pru_uart_pin
pin 97 (PIN97)

group: pinmux_P9_24_pruin_pin
pin 97 (PIN97)

group: pinmux_P9_26_default_pin
pin 96 (PIN96)

group: pinmux_P9_26_gpio_pin
pin 96 (PIN96)

group: pinmux_P9_26_gpio_pu_pin
pin 96 (PIN96)

group: pinmux_P9_26_gpio_pd_pin
pin 96 (PIN96)

group: pinmux_P9_26_uart_pin
pin 96 (PIN96)

group: pinmux_P9_26_can_pin
pin 96 (PIN96)

group: pinmux_P9_26_i2c_pin
pin 96 (PIN96)

group: pinmux_P9_26_pru_uart_pin
pin 96 (PIN96)

group: pinmux_P9_26_pruin_pin
pin 96 (PIN96)

group: pinmux_P9_27_default_pin
pin 105 (PIN105)

group: pinmux_P9_27_gpio_pin
pin 105 (PIN105)

group: pinmux_P9_27_gpio_pu_pin
pin 105 (PIN105)

group: pinmux_P9_27_gpio_pd_pin
pin 105 (PIN105)

group: pinmux_P9_27_eqep_pin
pin 105 (PIN105)

group: pinmux_P9_27_pruout_pin
pin 105 (PIN105)

group: pinmux_P9_27_pruin_pin
pin 105 (PIN105)

group: pinmux_P9_30_default_pin
pin 102 (PIN102)

group: pinmux_P9_30_gpio_pin
pin 102 (PIN102)

group: pinmux_P9_30_gpio_pu_pin
pin 102 (PIN102)

group: pinmux_P9_30_gpio_pd_pin
pin 102 (PIN102)

group: pinmux_P9_30_spi_pin
pin 102 (PIN102)

group: pinmux_P9_30_pwm_pin
pin 102 (PIN102)

group: pinmux_P9_30_pruout_pin
pin 102 (PIN102)

group: pinmux_P9_30_pruin_pin
pin 102 (PIN102)

group: pinmux_P9_41_default_pin
pin 109 (PIN109)

group: pinmux_P9_41_gpio_pin
pin 109 (PIN109)

group: pinmux_P9_41_gpio_pu_pin
pin 109 (PIN109)

group: pinmux_P9_41_gpio_pd_pin
pin 109 (PIN109)

group: pinmux_P9_41_timer_pin
pin 109 (PIN109)

group: pinmux_P9_41_pruin_pin
pin 109 (PIN109)

group: pinmux_P9_91_default_pin
pin 106 (PIN106)

group: pinmux_P9_91_gpio_pin
pin 106 (PIN106)

group: pinmux_P9_91_gpio_pu_pin
pin 106 (PIN106)

group: pinmux_P9_91_gpio_pd_pin
pin 106 (PIN106)

group: pinmux_P9_91_eqep_pin
pin 106 (PIN106)

group: pinmux_P9_91_pruout_pin
pin 106 (PIN106)

group: pinmux_P9_91_pruin_pin
pin 106 (PIN106)

group: pinmux_P9_42_default_pin
pin 89 (PIN89)

group: pinmux_P9_42_gpio_pin
pin 89 (PIN89)

group: pinmux_P9_42_gpio_pu_pin
pin 89 (PIN89)

group: pinmux_P9_42_gpio_pd_pin
pin 89 (PIN89)

group: pinmux_P9_42_spi_cs_pin
pin 89 (PIN89)

group: pinmux_P9_42_spi_sclk_pin
pin 89 (PIN89)

group: pinmux_P9_42_uart_pin
pin 89 (PIN89)

group: pinmux_P9_42_pwm_pin
pin 89 (PIN89)

group: pinmux_P9_42_pru_ecap_pwm_pin
pin 89 (PIN89)

group: pinmux_P9_92_default_pin
pin 104 (PIN104)

group: pinmux_P9_92_gpio_pin
pin 104 (PIN104)

group: pinmux_P9_92_gpio_pu_pin
pin 104 (PIN104)

group: pinmux_P9_92_gpio_pd_pin
pin 104 (PIN104)

group: pinmux_P9_92_eqep_pin
pin 104 (PIN104)

group: pinmux_P9_92_pruout_pin
pin 104 (PIN104)

group: pinmux_P9_92_pruin_pin
pin 104 (PIN104)

group: cpsw_default
pin 68 (PIN68)
pin 69 (PIN69)
pin 70 (PIN70)
pin 71 (PIN71)
pin 72 (PIN72)
pin 73 (PIN73)
pin 74 (PIN74)
pin 75 (PIN75)
pin 76 (PIN76)
pin 77 (PIN77)
pin 78 (PIN78)
pin 79 (PIN79)
pin 80 (PIN80)

group: cpsw_sleep
pin 68 (PIN68)
pin 69 (PIN69)
pin 70 (PIN70)
pin 71 (PIN71)
pin 72 (PIN72)
pin 73 (PIN73)
pin 74 (PIN74)
pin 75 (PIN75)
pin 76 (PIN76)
pin 77 (PIN77)
pin 78 (PIN78)
pin 79 (PIN79)
pin 80 (PIN80)

group: davinci_mdio_default
pin 82 (PIN82)
pin 83 (PIN83)
pin 90 (PIN90)

group: davinci_mdio_sleep
pin 82 (PIN82)
pin 83 (PIN83)
pin 90 (PIN90)

group: pinmux_mmc1_pins
pin 88 (PIN88)
pin 63 (PIN63)
pin 62 (PIN62)
pin 61 (PIN61)
pin 60 (PIN60)
pin 65 (PIN65)
pin 64 (PIN64)

group: pinmux_emmc_pins
pin 32 (PIN32)
pin 33 (PIN33)
pin 0 (PIN0)
pin 1 (PIN1)
pin 2 (PIN2)
pin 3 (PIN3)
pin 4 (PIN4)
pin 5 (PIN5)
pin 6 (PIN6)
pin 7 (PIN7)

group: user_leds_s0
pin 21 (PIN21)
pin 22 (PIN22)
pin 23 (PIN23)
pin 24 (PIN24)

group: pinmux_i2c0_pins
pin 98 (PIN98)
pin 99 (PIN99)

group: nxp_hdmi_bonelt_pins
pin 108 (PIN108)
pin 40 (PIN40)
pin 41 (PIN41)
pin 42 (PIN42)
pin 43 (PIN43)
pin 44 (PIN44)
pin 45 (PIN45)
pin 46 (PIN46)
pin 47 (PIN47)
pin 48 (PIN48)
pin 49 (PIN49)
pin 50 (PIN50)
pin 51 (PIN51)
pin 52 (PIN52)
pin 53 (PIN53)
pin 54 (PIN54)
pin 55 (PIN55)
pin 56 (PIN56)
pin 57 (PIN57)
pin 58 (PIN58)
pin 59 (PIN59)

group: nxp_hdmi_bonelt_off_pins
pin 108 (PIN108)

group: mcasp0_pins
pin 107 (PIN107)
pin 103 (PIN103)
pin 101 (PIN101)
pin 100 (PIN100)
pin 27 (PIN27)
```

#### $ cat pinmux-functions
```
function: pinmux_uart0_pins, groups = [ pinmux_uart0_pins ]
function: pinmux_P8_07_default_pin, groups = [ pinmux_P8_07_default_pin ]
function: pinmux_P8_07_gpio_pin, groups = [ pinmux_P8_07_gpio_pin ]
function: pinmux_P8_07_gpio_pu_pin, groups = [ pinmux_P8_07_gpio_pu_pin ]
function: pinmux_P8_07_gpio_pd_pin, groups = [ pinmux_P8_07_gpio_pd_pin ]
function: pinmux_P8_07_timer_pin, groups = [ pinmux_P8_07_timer_pin ]
function: pinmux_P8_08_default_pin, groups = [ pinmux_P8_08_default_pin ]
function: pinmux_P8_08_gpio_pin, groups = [ pinmux_P8_08_gpio_pin ]
function: pinmux_P8_08_gpio_pu_pin, groups = [ pinmux_P8_08_gpio_pu_pin ]
function: pinmux_P8_08_gpio_pd_pin, groups = [ pinmux_P8_08_gpio_pd_pin ]
function: pinmux_P8_08_timer_pin, groups = [ pinmux_P8_08_timer_pin ]
function: pinmux_P8_09_default_pin, groups = [ pinmux_P8_09_default_pin ]
function: pinmux_P8_09_gpio_pin, groups = [ pinmux_P8_09_gpio_pin ]
function: pinmux_P8_09_gpio_pu_pin, groups = [ pinmux_P8_09_gpio_pu_pin ]
function: pinmux_P8_09_gpio_pd_pin, groups = [ pinmux_P8_09_gpio_pd_pin ]
function: pinmux_P8_09_timer_pin, groups = [ pinmux_P8_09_timer_pin ]
function: pinmux_P8_10_default_pin, groups = [ pinmux_P8_10_default_pin ]
function: pinmux_P8_10_gpio_pin, groups = [ pinmux_P8_10_gpio_pin ]
function: pinmux_P8_10_gpio_pu_pin, groups = [ pinmux_P8_10_gpio_pu_pin ]
function: pinmux_P8_10_gpio_pd_pin, groups = [ pinmux_P8_10_gpio_pd_pin ]
function: pinmux_P8_10_timer_pin, groups = [ pinmux_P8_10_timer_pin ]
function: pinmux_P8_11_default_pin, groups = [ pinmux_P8_11_default_pin ]
function: pinmux_P8_11_gpio_pin, groups = [ pinmux_P8_11_gpio_pin ]
function: pinmux_P8_11_gpio_pu_pin, groups = [ pinmux_P8_11_gpio_pu_pin ]
function: pinmux_P8_11_gpio_pd_pin, groups = [ pinmux_P8_11_gpio_pd_pin ]
function: pinmux_P8_11_eqep_pin, groups = [ pinmux_P8_11_eqep_pin ]
function: pinmux_P8_11_pruout_pin, groups = [ pinmux_P8_11_pruout_pin ]
function: pinmux_P8_12_default_pin, groups = [ pinmux_P8_12_default_pin ]
function: pinmux_P8_12_gpio_pin, groups = [ pinmux_P8_12_gpio_pin ]
function: pinmux_P8_12_gpio_pu_pin, groups = [ pinmux_P8_12_gpio_pu_pin ]
function: pinmux_P8_12_gpio_pd_pin, groups = [ pinmux_P8_12_gpio_pd_pin ]
function: pinmux_P8_12_eqep_pin, groups = [ pinmux_P8_12_eqep_pin ]
function: pinmux_P8_12_pruout_pin, groups = [ pinmux_P8_12_pruout_pin ]
function: pinmux_P8_13_default_pin, groups = [ pinmux_P8_13_default_pin ]
function: pinmux_P8_13_gpio_pin, groups = [ pinmux_P8_13_gpio_pin ]
function: pinmux_P8_13_gpio_pu_pin, groups = [ pinmux_P8_13_gpio_pu_pin ]
function: pinmux_P8_13_gpio_pd_pin, groups = [ pinmux_P8_13_gpio_pd_pin ]
function: pinmux_P8_13_pwm_pin, groups = [ pinmux_P8_13_pwm_pin ]
function: pinmux_P8_14_default_pin, groups = [ pinmux_P8_14_default_pin ]
function: pinmux_P8_14_gpio_pin, groups = [ pinmux_P8_14_gpio_pin ]
function: pinmux_P8_14_gpio_pu_pin, groups = [ pinmux_P8_14_gpio_pu_pin ]
function: pinmux_P8_14_gpio_pd_pin, groups = [ pinmux_P8_14_gpio_pd_pin ]
function: pinmux_P8_14_pwm_pin, groups = [ pinmux_P8_14_pwm_pin ]
function: pinmux_P8_15_default_pin, groups = [ pinmux_P8_15_default_pin ]
function: pinmux_P8_15_gpio_pin, groups = [ pinmux_P8_15_gpio_pin ]
function: pinmux_P8_15_gpio_pu_pin, groups = [ pinmux_P8_15_gpio_pu_pin ]
function: pinmux_P8_15_gpio_pd_pin, groups = [ pinmux_P8_15_gpio_pd_pin ]
function: pinmux_P8_15_eqep_pin, groups = [ pinmux_P8_15_eqep_pin ]
function: pinmux_P8_15_pru_ecap_pwm_pin, groups = [ pinmux_P8_15_pru_ecap_pwm_pin ]
function: pinmux_P8_15_pruin_pin, groups = [ pinmux_P8_15_pruin_pin ]
function: pinmux_P8_16_default_pin, groups = [ pinmux_P8_16_default_pin ]
function: pinmux_P8_16_gpio_pin, groups = [ pinmux_P8_16_gpio_pin ]
function: pinmux_P8_16_gpio_pu_pin, groups = [ pinmux_P8_16_gpio_pu_pin ]
function: pinmux_P8_16_gpio_pd_pin, groups = [ pinmux_P8_16_gpio_pd_pin ]
function: pinmux_P8_16_eqep_pin, groups = [ pinmux_P8_16_eqep_pin ]
function: pinmux_P8_16_pruin_pin, groups = [ pinmux_P8_16_pruin_pin ]
function: pinmux_P8_17_default_pin, groups = [ pinmux_P8_17_default_pin ]
function: pinmux_P8_17_gpio_pin, groups = [ pinmux_P8_17_gpio_pin ]
function: pinmux_P8_17_gpio_pu_pin, groups = [ pinmux_P8_17_gpio_pu_pin ]
function: pinmux_P8_17_gpio_pd_pin, groups = [ pinmux_P8_17_gpio_pd_pin ]
function: pinmux_P8_17_pwm_pin, groups = [ pinmux_P8_17_pwm_pin ]
function: pinmux_P8_18_default_pin, groups = [ pinmux_P8_18_default_pin ]
function: pinmux_P8_18_gpio_pin, groups = [ pinmux_P8_18_gpio_pin ]
function: pinmux_P8_18_gpio_pu_pin, groups = [ pinmux_P8_18_gpio_pu_pin ]
function: pinmux_P8_18_gpio_pd_pin, groups = [ pinmux_P8_18_gpio_pd_pin ]
function: pinmux_P8_19_default_pin, groups = [ pinmux_P8_19_default_pin ]
function: pinmux_P8_19_gpio_pin, groups = [ pinmux_P8_19_gpio_pin ]
function: pinmux_P8_19_gpio_pu_pin, groups = [ pinmux_P8_19_gpio_pu_pin ]
function: pinmux_P8_19_gpio_pd_pin, groups = [ pinmux_P8_19_gpio_pd_pin ]
function: pinmux_P8_19_pwm_pin, groups = [ pinmux_P8_19_pwm_pin ]
function: pinmux_P8_26_default_pin, groups = [ pinmux_P8_26_default_pin ]
function: pinmux_P8_26_gpio_pin, groups = [ pinmux_P8_26_gpio_pin ]
function: pinmux_P8_26_gpio_pu_pin, groups = [ pinmux_P8_26_gpio_pu_pin ]
function: pinmux_P8_26_gpio_pd_pin, groups = [ pinmux_P8_26_gpio_pd_pin ]
function: pinmux_P9_11_default_pin, groups = [ pinmux_P9_11_default_pin ]
function: pinmux_P9_11_gpio_pin, groups = [ pinmux_P9_11_gpio_pin ]
function: pinmux_P9_11_gpio_pu_pin, groups = [ pinmux_P9_11_gpio_pu_pin ]
function: pinmux_P9_11_gpio_pd_pin, groups = [ pinmux_P9_11_gpio_pd_pin ]
function: pinmux_P9_11_uart_pin, groups = [ pinmux_P9_11_uart_pin ]
function: pinmux_P9_12_default_pin, groups = [ pinmux_P9_12_default_pin ]
function: pinmux_P9_12_gpio_pin, groups = [ pinmux_P9_12_gpio_pin ]
function: pinmux_P9_12_gpio_pu_pin, groups = [ pinmux_P9_12_gpio_pu_pin ]
function: pinmux_P9_12_gpio_pd_pin, groups = [ pinmux_P9_12_gpio_pd_pin ]
function: pinmux_P9_13_default_pin, groups = [ pinmux_P9_13_default_pin ]
function: pinmux_P9_13_gpio_pin, groups = [ pinmux_P9_13_gpio_pin ]
function: pinmux_P9_13_gpio_pu_pin, groups = [ pinmux_P9_13_gpio_pu_pin ]
function: pinmux_P9_13_gpio_pd_pin, groups = [ pinmux_P9_13_gpio_pd_pin ]
function: pinmux_P9_13_uart_pin, groups = [ pinmux_P9_13_uart_pin ]
function: pinmux_P9_14_default_pin, groups = [ pinmux_P9_14_default_pin ]
function: pinmux_P9_14_gpio_pin, groups = [ pinmux_P9_14_gpio_pin ]
function: pinmux_P9_14_gpio_pu_pin, groups = [ pinmux_P9_14_gpio_pu_pin ]
function: pinmux_P9_14_gpio_pd_pin, groups = [ pinmux_P9_14_gpio_pd_pin ]
function: pinmux_P9_14_pwm_pin, groups = [ pinmux_P9_14_pwm_pin ]
function: pinmux_P9_15_default_pin, groups = [ pinmux_P9_15_default_pin ]
function: pinmux_P9_15_gpio_pin, groups = [ pinmux_P9_15_gpio_pin ]
function: pinmux_P9_15_gpio_pu_pin, groups = [ pinmux_P9_15_gpio_pu_pin ]
function: pinmux_P9_15_gpio_pd_pin, groups = [ pinmux_P9_15_gpio_pd_pin ]
function: pinmux_P9_15_pwm_pin, groups = [ pinmux_P9_15_pwm_pin ]
function: pinmux_P9_16_default_pin, groups = [ pinmux_P9_16_default_pin ]
function: pinmux_P9_16_gpio_pin, groups = [ pinmux_P9_16_gpio_pin ]
function: pinmux_P9_16_gpio_pu_pin, groups = [ pinmux_P9_16_gpio_pu_pin ]
function: pinmux_P9_16_gpio_pd_pin, groups = [ pinmux_P9_16_gpio_pd_pin ]
function: pinmux_P9_16_pwm_pin, groups = [ pinmux_P9_16_pwm_pin ]
function: pinmux_P9_17_default_pin, groups = [ pinmux_P9_17_default_pin ]
function: pinmux_P9_17_gpio_pin, groups = [ pinmux_P9_17_gpio_pin ]
function: pinmux_P9_17_gpio_pu_pin, groups = [ pinmux_P9_17_gpio_pu_pin ]
function: pinmux_P9_17_gpio_pd_pin, groups = [ pinmux_P9_17_gpio_pd_pin ]
function: pinmux_P9_17_spi_cs_pin, groups = [ pinmux_P9_17_spi_cs_pin ]
function: pinmux_P9_17_i2c_pin, groups = [ pinmux_P9_17_i2c_pin ]
function: pinmux_P9_17_pwm_pin, groups = [ pinmux_P9_17_pwm_pin ]
function: pinmux_P9_17_pru_uart_pin, groups = [ pinmux_P9_17_pru_uart_pin ]
function: pinmux_P9_18_default_pin, groups = [ pinmux_P9_18_default_pin ]
function: pinmux_P9_18_gpio_pin, groups = [ pinmux_P9_18_gpio_pin ]
function: pinmux_P9_18_gpio_pu_pin, groups = [ pinmux_P9_18_gpio_pu_pin ]
function: pinmux_P9_18_gpio_pd_pin, groups = [ pinmux_P9_18_gpio_pd_pin ]
function: pinmux_P9_18_spi_pin, groups = [ pinmux_P9_18_spi_pin ]
function: pinmux_P9_18_i2c_pin, groups = [ pinmux_P9_18_i2c_pin ]
function: pinmux_P9_18_pwm_pin, groups = [ pinmux_P9_18_pwm_pin ]
function: pinmux_P9_18_pru_uart_pin, groups = [ pinmux_P9_18_pru_uart_pin ]
function: pinmux_P9_19_default_pin, groups = [ pinmux_P9_19_default_pin ]
function: pinmux_P9_19_gpio_pin, groups = [ pinmux_P9_19_gpio_pin ]
function: pinmux_P9_19_gpio_pu_pin, groups = [ pinmux_P9_19_gpio_pu_pin ]
function: pinmux_P9_19_gpio_pd_pin, groups = [ pinmux_P9_19_gpio_pd_pin ]
function: pinmux_P9_19_spi_cs_pin, groups = [ pinmux_P9_19_spi_cs_pin ]
function: pinmux_P9_19_can_pin, groups = [ pinmux_P9_19_can_pin ]
function: pinmux_P9_19_i2c_pin, groups = [ pinmux_P9_19_i2c_pin ]
function: pinmux_P9_19_pru_uart_pin, groups = [ pinmux_P9_19_pru_uart_pin ]
function: pinmux_P9_19_timer_pin, groups = [ pinmux_P9_19_timer_pin ]
function: pinmux_P9_20_default_pin, groups = [ pinmux_P9_20_default_pin ]
function: pinmux_P9_20_gpio_pin, groups = [ pinmux_P9_20_gpio_pin ]
function: pinmux_P9_20_gpio_pu_pin, groups = [ pinmux_P9_20_gpio_pu_pin ]
function: pinmux_P9_20_gpio_pd_pin, groups = [ pinmux_P9_20_gpio_pd_pin ]
function: pinmux_P9_20_spi_cs_pin, groups = [ pinmux_P9_20_spi_cs_pin ]
function: pinmux_P9_20_can_pin, groups = [ pinmux_P9_20_can_pin ]
function: pinmux_P9_20_i2c_pin, groups = [ pinmux_P9_20_i2c_pin ]
function: pinmux_P9_20_pru_uart_pin, groups = [ pinmux_P9_20_pru_uart_pin ]
function: pinmux_P9_20_timer_pin, groups = [ pinmux_P9_20_timer_pin ]
function: pinmux_P9_21_default_pin, groups = [ pinmux_P9_21_default_pin ]
function: pinmux_P9_21_gpio_pin, groups = [ pinmux_P9_21_gpio_pin ]
function: pinmux_P9_21_gpio_pu_pin, groups = [ pinmux_P9_21_gpio_pu_pin ]
function: pinmux_P9_21_gpio_pd_pin, groups = [ pinmux_P9_21_gpio_pd_pin ]
function: pinmux_P9_21_spi_pin, groups = [ pinmux_P9_21_spi_pin ]
function: pinmux_P9_21_uart_pin, groups = [ pinmux_P9_21_uart_pin ]
function: pinmux_P9_21_i2c_pin, groups = [ pinmux_P9_21_i2c_pin ]
function: pinmux_P9_21_pwm_pin, groups = [ pinmux_P9_21_pwm_pin ]
function: pinmux_P9_21_pru_uart_pin, groups = [ pinmux_P9_21_pru_uart_pin ]
function: pinmux_P9_22_default_pin, groups = [ pinmux_P9_22_default_pin ]
function: pinmux_P9_22_gpio_pin, groups = [ pinmux_P9_22_gpio_pin ]
function: pinmux_P9_22_gpio_pu_pin, groups = [ pinmux_P9_22_gpio_pu_pin ]
function: pinmux_P9_22_gpio_pd_pin, groups = [ pinmux_P9_22_gpio_pd_pin ]
function: pinmux_P9_22_spi_sclk_pin, groups = [ pinmux_P9_22_spi_sclk_pin ]
function: pinmux_P9_22_uart_pin, groups = [ pinmux_P9_22_uart_pin ]
function: pinmux_P9_22_i2c_pin, groups = [ pinmux_P9_22_i2c_pin ]
function: pinmux_P9_22_pwm_pin, groups = [ pinmux_P9_22_pwm_pin ]
function: pinmux_P9_22_pru_uart_pin, groups = [ pinmux_P9_22_pru_uart_pin ]
function: pinmux_P9_23_default_pin, groups = [ pinmux_P9_23_default_pin ]
function: pinmux_P9_23_gpio_pin, groups = [ pinmux_P9_23_gpio_pin ]
function: pinmux_P9_23_gpio_pu_pin, groups = [ pinmux_P9_23_gpio_pu_pin ]
function: pinmux_P9_23_gpio_pd_pin, groups = [ pinmux_P9_23_gpio_pd_pin ]
function: pinmux_P9_23_pwm_pin, groups = [ pinmux_P9_23_pwm_pin ]
function: pinmux_P9_24_default_pin, groups = [ pinmux_P9_24_default_pin ]
function: pinmux_P9_24_gpio_pin, groups = [ pinmux_P9_24_gpio_pin ]
function: pinmux_P9_24_gpio_pu_pin, groups = [ pinmux_P9_24_gpio_pu_pin ]
function: pinmux_P9_24_gpio_pd_pin, groups = [ pinmux_P9_24_gpio_pd_pin ]
function: pinmux_P9_24_uart_pin, groups = [ pinmux_P9_24_uart_pin ]
function: pinmux_P9_24_can_pin, groups = [ pinmux_P9_24_can_pin ]
function: pinmux_P9_24_i2c_pin, groups = [ pinmux_P9_24_i2c_pin ]
function: pinmux_P9_24_pru_uart_pin, groups = [ pinmux_P9_24_pru_uart_pin ]
function: pinmux_P9_24_pruin_pin, groups = [ pinmux_P9_24_pruin_pin ]
function: pinmux_P9_26_default_pin, groups = [ pinmux_P9_26_default_pin ]
function: pinmux_P9_26_gpio_pin, groups = [ pinmux_P9_26_gpio_pin ]
function: pinmux_P9_26_gpio_pu_pin, groups = [ pinmux_P9_26_gpio_pu_pin ]
function: pinmux_P9_26_gpio_pd_pin, groups = [ pinmux_P9_26_gpio_pd_pin ]
function: pinmux_P9_26_uart_pin, groups = [ pinmux_P9_26_uart_pin ]
function: pinmux_P9_26_can_pin, groups = [ pinmux_P9_26_can_pin ]
function: pinmux_P9_26_i2c_pin, groups = [ pinmux_P9_26_i2c_pin ]
function: pinmux_P9_26_pru_uart_pin, groups = [ pinmux_P9_26_pru_uart_pin ]
function: pinmux_P9_26_pruin_pin, groups = [ pinmux_P9_26_pruin_pin ]
function: pinmux_P9_27_default_pin, groups = [ pinmux_P9_27_default_pin ]
function: pinmux_P9_27_gpio_pin, groups = [ pinmux_P9_27_gpio_pin ]
function: pinmux_P9_27_gpio_pu_pin, groups = [ pinmux_P9_27_gpio_pu_pin ]
function: pinmux_P9_27_gpio_pd_pin, groups = [ pinmux_P9_27_gpio_pd_pin ]
function: pinmux_P9_27_eqep_pin, groups = [ pinmux_P9_27_eqep_pin ]
function: pinmux_P9_27_pruout_pin, groups = [ pinmux_P9_27_pruout_pin ]
function: pinmux_P9_27_pruin_pin, groups = [ pinmux_P9_27_pruin_pin ]
function: pinmux_P9_30_default_pin, groups = [ pinmux_P9_30_default_pin ]
function: pinmux_P9_30_gpio_pin, groups = [ pinmux_P9_30_gpio_pin ]
function: pinmux_P9_30_gpio_pu_pin, groups = [ pinmux_P9_30_gpio_pu_pin ]
function: pinmux_P9_30_gpio_pd_pin, groups = [ pinmux_P9_30_gpio_pd_pin ]
function: pinmux_P9_30_spi_pin, groups = [ pinmux_P9_30_spi_pin ]
function: pinmux_P9_30_pwm_pin, groups = [ pinmux_P9_30_pwm_pin ]
function: pinmux_P9_30_pruout_pin, groups = [ pinmux_P9_30_pruout_pin ]
function: pinmux_P9_30_pruin_pin, groups = [ pinmux_P9_30_pruin_pin ]
function: pinmux_P9_41_default_pin, groups = [ pinmux_P9_41_default_pin ]
function: pinmux_P9_41_gpio_pin, groups = [ pinmux_P9_41_gpio_pin ]
function: pinmux_P9_41_gpio_pu_pin, groups = [ pinmux_P9_41_gpio_pu_pin ]
function: pinmux_P9_41_gpio_pd_pin, groups = [ pinmux_P9_41_gpio_pd_pin ]
function: pinmux_P9_41_timer_pin, groups = [ pinmux_P9_41_timer_pin ]
function: pinmux_P9_41_pruin_pin, groups = [ pinmux_P9_41_pruin_pin ]
function: pinmux_P9_91_default_pin, groups = [ pinmux_P9_91_default_pin ]
function: pinmux_P9_91_gpio_pin, groups = [ pinmux_P9_91_gpio_pin ]
function: pinmux_P9_91_gpio_pu_pin, groups = [ pinmux_P9_91_gpio_pu_pin ]
function: pinmux_P9_91_gpio_pd_pin, groups = [ pinmux_P9_91_gpio_pd_pin ]
function: pinmux_P9_91_eqep_pin, groups = [ pinmux_P9_91_eqep_pin ]
function: pinmux_P9_91_pruout_pin, groups = [ pinmux_P9_91_pruout_pin ]
function: pinmux_P9_91_pruin_pin, groups = [ pinmux_P9_91_pruin_pin ]
function: pinmux_P9_42_default_pin, groups = [ pinmux_P9_42_default_pin ]
function: pinmux_P9_42_gpio_pin, groups = [ pinmux_P9_42_gpio_pin ]
function: pinmux_P9_42_gpio_pu_pin, groups = [ pinmux_P9_42_gpio_pu_pin ]
function: pinmux_P9_42_gpio_pd_pin, groups = [ pinmux_P9_42_gpio_pd_pin ]
function: pinmux_P9_42_spi_cs_pin, groups = [ pinmux_P9_42_spi_cs_pin ]
function: pinmux_P9_42_spi_sclk_pin, groups = [ pinmux_P9_42_spi_sclk_pin ]
function: pinmux_P9_42_uart_pin, groups = [ pinmux_P9_42_uart_pin ]
function: pinmux_P9_42_pwm_pin, groups = [ pinmux_P9_42_pwm_pin ]
function: pinmux_P9_42_pru_ecap_pwm_pin, groups = [ pinmux_P9_42_pru_ecap_pwm_pin ]
function: pinmux_P9_92_default_pin, groups = [ pinmux_P9_92_default_pin ]
function: pinmux_P9_92_gpio_pin, groups = [ pinmux_P9_92_gpio_pin ]
function: pinmux_P9_92_gpio_pu_pin, groups = [ pinmux_P9_92_gpio_pu_pin ]
function: pinmux_P9_92_gpio_pd_pin, groups = [ pinmux_P9_92_gpio_pd_pin ]
function: pinmux_P9_92_eqep_pin, groups = [ pinmux_P9_92_eqep_pin ]
function: pinmux_P9_92_pruout_pin, groups = [ pinmux_P9_92_pruout_pin ]
function: pinmux_P9_92_pruin_pin, groups = [ pinmux_P9_92_pruin_pin ]
function: cpsw_default, groups = [ cpsw_default ]
function: cpsw_sleep, groups = [ cpsw_sleep ]
function: davinci_mdio_default, groups = [ davinci_mdio_default ]
function: davinci_mdio_sleep, groups = [ davinci_mdio_sleep ]
function: pinmux_mmc1_pins, groups = [ pinmux_mmc1_pins ]
function: pinmux_emmc_pins, groups = [ pinmux_emmc_pins ]
function: user_leds_s0, groups = [ user_leds_s0 ]
function: pinmux_i2c0_pins, groups = [ pinmux_i2c0_pins ]
function: nxp_hdmi_bonelt_pins, groups = [ nxp_hdmi_bonelt_pins ]
function: nxp_hdmi_bonelt_off_pins, groups = [ nxp_hdmi_bonelt_off_pins ]
function: mcasp0_pins, groups = [ mcasp0_pins ]
```

#### $ cat pinmux-pins
```
Pinmux settings per pin
Format: pin (name): mux_owner gpio_owner hog?
pin 0 (PIN0): 481d8000.mmc (GPIO UNCLAIMED) function pinmux_emmc_pins group pinmux_emmc_pins
pin 1 (PIN1): 481d8000.mmc (GPIO UNCLAIMED) function pinmux_emmc_pins group pinmux_emmc_pins
pin 2 (PIN2): 481d8000.mmc (GPIO UNCLAIMED) function pinmux_emmc_pins group pinmux_emmc_pins
pin 3 (PIN3): 481d8000.mmc (GPIO UNCLAIMED) function pinmux_emmc_pins group pinmux_emmc_pins
pin 4 (PIN4): 481d8000.mmc (GPIO UNCLAIMED) function pinmux_emmc_pins group pinmux_emmc_pins
pin 5 (PIN5): 481d8000.mmc (GPIO UNCLAIMED) function pinmux_emmc_pins group pinmux_emmc_pins
pin 6 (PIN6): 481d8000.mmc (GPIO UNCLAIMED) function pinmux_emmc_pins group pinmux_emmc_pins
pin 7 (PIN7): 481d8000.mmc (GPIO UNCLAIMED) function pinmux_emmc_pins group pinmux_emmc_pins
pin 8 (PIN8): ocp:P8_19_pinmux (GPIO UNCLAIMED) function pinmux_P8_19_default_pin group pinmux_P8_19_default_pin
pin 9 (PIN9): ocp:P8_13_pinmux (GPIO UNCLAIMED) function pinmux_P8_13_default_pin group pinmux_P8_13_default_pin
pin 10 (PIN10): ocp:P8_14_pinmux (GPIO UNCLAIMED) function pinmux_P8_14_default_pin group pinmux_P8_14_default_pin
pin 11 (PIN11): ocp:P8_17_pinmux (GPIO UNCLAIMED) function pinmux_P8_17_default_pin group pinmux_P8_17_default_pin
pin 12 (PIN12): ocp:P8_12_pinmux (GPIO UNCLAIMED) function pinmux_P8_12_default_pin group pinmux_P8_12_default_pin
pin 13 (PIN13): ocp:P8_11_pinmux (GPIO UNCLAIMED) function pinmux_P8_11_default_pin group pinmux_P8_11_default_pin
pin 14 (PIN14): ocp:P8_16_pinmux (GPIO UNCLAIMED) function pinmux_P8_16_default_pin group pinmux_P8_16_default_pin
pin 15 (PIN15): ocp:P8_15_pinmux (GPIO UNCLAIMED) function pinmux_P8_15_default_pin group pinmux_P8_15_default_pin
pin 16 (PIN16): ocp:P9_15_pinmux (GPIO UNCLAIMED) function pinmux_P9_15_default_pin group pinmux_P9_15_default_pin
pin 17 (PIN17): ocp:P9_23_pinmux (GPIO UNCLAIMED) function pinmux_P9_23_default_pin group pinmux_P9_23_default_pin
pin 18 (PIN18): ocp:P9_14_pinmux (GPIO UNCLAIMED) function pinmux_P9_14_default_pin group pinmux_P9_14_default_pin
pin 19 (PIN19): ocp:P9_16_pinmux (GPIO UNCLAIMED) function pinmux_P9_16_default_pin group pinmux_P9_16_default_pin
pin 20 (PIN20): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 21 (PIN21): leds (GPIO UNCLAIMED) function user_leds_s0 group user_leds_s0
pin 22 (PIN22): leds (GPIO UNCLAIMED) function user_leds_s0 group user_leds_s0
pin 23 (PIN23): leds (GPIO UNCLAIMED) function user_leds_s0 group user_leds_s0
pin 24 (PIN24): leds (GPIO UNCLAIMED) function user_leds_s0 group user_leds_s0
pin 25 (PIN25): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 26 (PIN26): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 27 (PIN27): 48038000.mcasp (GPIO UNCLAIMED) function mcasp0_pins group mcasp0_pins
pin 28 (PIN28): ocp:P9_11_pinmux (GPIO UNCLAIMED) function pinmux_P9_11_default_pin group pinmux_P9_11_default_pin
pin 29 (PIN29): ocp:P9_13_pinmux (GPIO UNCLAIMED) function pinmux_P9_13_default_pin group pinmux_P9_13_default_pin
pin 30 (PIN30): ocp:P9_12_pinmux (GPIO UNCLAIMED) function pinmux_P9_12_default_pin group pinmux_P9_12_default_pin
pin 31 (PIN31): ocp:P8_26_pinmux (GPIO UNCLAIMED) function pinmux_P8_26_default_pin group pinmux_P8_26_default_pin
pin 32 (PIN32): 481d8000.mmc (GPIO UNCLAIMED) function pinmux_emmc_pins group pinmux_emmc_pins
pin 33 (PIN33): 481d8000.mmc (GPIO UNCLAIMED) function pinmux_emmc_pins group pinmux_emmc_pins
pin 34 (PIN34): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 35 (PIN35): ocp:P8_18_pinmux (GPIO UNCLAIMED) function pinmux_P8_18_default_pin group pinmux_P8_18_default_pin
pin 36 (PIN36): ocp:P8_07_pinmux (GPIO UNCLAIMED) function pinmux_P8_07_default_pin group pinmux_P8_07_default_pin
pin 37 (PIN37): ocp:P8_08_pinmux (GPIO UNCLAIMED) function pinmux_P8_08_default_pin group pinmux_P8_08_default_pin
pin 38 (PIN38): ocp:P8_10_pinmux (GPIO UNCLAIMED) function pinmux_P8_10_default_pin group pinmux_P8_10_default_pin
pin 39 (PIN39): ocp:P8_09_pinmux (GPIO UNCLAIMED) function pinmux_P8_09_default_pin group pinmux_P8_09_default_pin
pin 40 (PIN40): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 41 (PIN41): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 42 (PIN42): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 43 (PIN43): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 44 (PIN44): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 45 (PIN45): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 46 (PIN46): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 47 (PIN47): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 48 (PIN48): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 49 (PIN49): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 50 (PIN50): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 51 (PIN51): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 52 (PIN52): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 53 (PIN53): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 54 (PIN54): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 55 (PIN55): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 56 (PIN56): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 57 (PIN57): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 58 (PIN58): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 59 (PIN59): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 60 (PIN60): 48060000.mmc (GPIO UNCLAIMED) function pinmux_mmc1_pins group pinmux_mmc1_pins
pin 61 (PIN61): 48060000.mmc (GPIO UNCLAIMED) function pinmux_mmc1_pins group pinmux_mmc1_pins
pin 62 (PIN62): 48060000.mmc (GPIO UNCLAIMED) function pinmux_mmc1_pins group pinmux_mmc1_pins
pin 63 (PIN63): 48060000.mmc (GPIO UNCLAIMED) function pinmux_mmc1_pins group pinmux_mmc1_pins
pin 64 (PIN64): 48060000.mmc (GPIO UNCLAIMED) function pinmux_mmc1_pins group pinmux_mmc1_pins
pin 65 (PIN65): 48060000.mmc (GPIO UNCLAIMED) function pinmux_mmc1_pins group pinmux_mmc1_pins
pin 66 (PIN66): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 67 (PIN67): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 68 (PIN68): 4a100000.ethernet (GPIO UNCLAIMED) function cpsw_default group cpsw_default
pin 69 (PIN69): 4a100000.ethernet (GPIO UNCLAIMED) function cpsw_default group cpsw_default
pin 70 (PIN70): 4a100000.ethernet (GPIO UNCLAIMED) function cpsw_default group cpsw_default
pin 71 (PIN71): 4a100000.ethernet (GPIO UNCLAIMED) function cpsw_default group cpsw_default
pin 72 (PIN72): 4a100000.ethernet (GPIO UNCLAIMED) function cpsw_default group cpsw_default
pin 73 (PIN73): 4a100000.ethernet (GPIO UNCLAIMED) function cpsw_default group cpsw_default
pin 74 (PIN74): 4a100000.ethernet (GPIO UNCLAIMED) function cpsw_default group cpsw_default
pin 75 (PIN75): 4a100000.ethernet (GPIO UNCLAIMED) function cpsw_default group cpsw_default
pin 76 (PIN76): 4a100000.ethernet (GPIO UNCLAIMED) function cpsw_default group cpsw_default
pin 77 (PIN77): 4a100000.ethernet (GPIO UNCLAIMED) function cpsw_default group cpsw_default
pin 78 (PIN78): 4a100000.ethernet (GPIO UNCLAIMED) function cpsw_default group cpsw_default
pin 79 (PIN79): 4a100000.ethernet (GPIO UNCLAIMED) function cpsw_default group cpsw_default
pin 80 (PIN80): 4a100000.ethernet (GPIO UNCLAIMED) function cpsw_default group cpsw_default
pin 81 (PIN81): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 82 (PIN82): 4a101000.mdio (GPIO UNCLAIMED) function davinci_mdio_default group davinci_mdio_default
pin 83 (PIN83): 4a101000.mdio (GPIO UNCLAIMED) function davinci_mdio_default group davinci_mdio_default
pin 84 (PIN84): ocp:P9_22_pinmux (GPIO UNCLAIMED) function pinmux_P9_22_default_pin group pinmux_P9_22_default_pin
pin 85 (PIN85): ocp:P9_21_pinmux (GPIO UNCLAIMED) function pinmux_P9_21_default_pin group pinmux_P9_21_default_pin
pin 86 (PIN86): ocp:P9_18_pinmux (GPIO UNCLAIMED) function pinmux_P9_18_default_pin group pinmux_P9_18_default_pin
pin 87 (PIN87): ocp:P9_17_pinmux (GPIO UNCLAIMED) function pinmux_P9_17_default_pin group pinmux_P9_17_default_pin
pin 88 (PIN88): 48060000.mmc (GPIO UNCLAIMED) function pinmux_mmc1_pins group pinmux_mmc1_pins
pin 89 (PIN89): ocp:P9_42_pinmux (GPIO UNCLAIMED) function pinmux_P9_42_default_pin group pinmux_P9_42_default_pin
pin 90 (PIN90): 4a101000.mdio (GPIO UNCLAIMED) function davinci_mdio_default group davinci_mdio_default
pin 91 (PIN91): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 92 (PIN92): 44e09000.serial (GPIO UNCLAIMED) function pinmux_uart0_pins group pinmux_uart0_pins
pin 93 (PIN93): 44e09000.serial (GPIO UNCLAIMED) function pinmux_uart0_pins group pinmux_uart0_pins
pin 94 (PIN94): ocp:P9_20_pinmux (GPIO UNCLAIMED) function pinmux_P9_20_default_pin group pinmux_P9_20_default_pin
pin 95 (PIN95): ocp:P9_19_pinmux (GPIO UNCLAIMED) function pinmux_P9_19_default_pin group pinmux_P9_19_default_pin
pin 96 (PIN96): ocp:P9_26_pinmux (GPIO UNCLAIMED) function pinmux_P9_26_default_pin group pinmux_P9_26_default_pin
pin 97 (PIN97): ocp:P9_24_pinmux (GPIO UNCLAIMED) function pinmux_P9_24_default_pin group pinmux_P9_24_default_pin
pin 98 (PIN98): 44e0b000.i2c (GPIO UNCLAIMED) function pinmux_i2c0_pins group pinmux_i2c0_pins
pin 99 (PIN99): 44e0b000.i2c (GPIO UNCLAIMED) function pinmux_i2c0_pins group pinmux_i2c0_pins
pin 100 (PIN100): 48038000.mcasp (GPIO UNCLAIMED) function mcasp0_pins group mcasp0_pins
pin 101 (PIN101): 48038000.mcasp (GPIO UNCLAIMED) function mcasp0_pins group mcasp0_pins
pin 102 (PIN102): ocp:P9_30_pinmux (GPIO UNCLAIMED) function pinmux_P9_30_default_pin group pinmux_P9_30_default_pin
pin 103 (PIN103): 48038000.mcasp (GPIO UNCLAIMED) function mcasp0_pins group mcasp0_pins
pin 104 (PIN104): ocp:P9_92_pinmux (GPIO UNCLAIMED) function pinmux_P9_92_default_pin group pinmux_P9_92_default_pin
pin 105 (PIN105): ocp:P9_27_pinmux (GPIO UNCLAIMED) function pinmux_P9_27_default_pin group pinmux_P9_27_default_pin
pin 106 (PIN106): ocp:P9_91_pinmux (GPIO UNCLAIMED) function pinmux_P9_91_default_pin group pinmux_P9_91_default_pin
pin 107 (PIN107): 48038000.mcasp (GPIO UNCLAIMED) function mcasp0_pins group mcasp0_pins
pin 108 (PIN108): 0-0070 (GPIO UNCLAIMED) function nxp_hdmi_bonelt_pins group nxp_hdmi_bonelt_pins
pin 109 (PIN109): ocp:P9_41_pinmux (GPIO UNCLAIMED) function pinmux_P9_41_default_pin group pinmux_P9_41_default_pin
pin 110 (PIN110): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 111 (PIN111): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 112 (PIN112): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 113 (PIN113): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 114 (PIN114): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 115 (PIN115): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 116 (PIN116): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 117 (PIN117): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 118 (PIN118): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 119 (PIN119): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 120 (PIN120): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 121 (PIN121): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 122 (PIN122): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 123 (PIN123): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 124 (PIN124): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 125 (PIN125): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 126 (PIN126): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 127 (PIN127): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 128 (PIN128): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 129 (PIN129): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 130 (PIN130): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 131 (PIN131): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 132 (PIN132): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 133 (PIN133): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 134 (PIN134): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 135 (PIN135): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 136 (PIN136): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 137 (PIN137): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 138 (PIN138): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 139 (PIN139): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 140 (PIN140): (MUX UNCLAIMED) (GPIO UNCLAIMED)
pin 141 (PIN141): (MUX UNCLAIMED) (GPIO UNCLAIMED)
```

#### $ cat pins
```
debian@BeagleBone:/sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single$ cat pins
registered pins: 142
pin 0 (PIN0) 0:gpio-32-63 44e10800 00000031 pinctrl-single
pin 1 (PIN1) 1:gpio-32-63 44e10804 00000031 pinctrl-single
pin 2 (PIN2) 2:gpio-32-63 44e10808 00000031 pinctrl-single
pin 3 (PIN3) 3:gpio-32-63 44e1080c 00000031 pinctrl-single
pin 4 (PIN4) 4:gpio-32-63 44e10810 00000031 pinctrl-single
pin 5 (PIN5) 5:gpio-32-63 44e10814 00000031 pinctrl-single
pin 6 (PIN6) 6:gpio-32-63 44e10818 00000031 pinctrl-single
pin 7 (PIN7) 7:gpio-32-63 44e1081c 00000031 pinctrl-single
pin 8 (PIN8) 22:gpio-0-31 44e10820 00000027 pinctrl-single
pin 9 (PIN9) 23:gpio-0-31 44e10824 00000027 pinctrl-single
pin 10 (PIN10) 26:gpio-0-31 44e10828 00000027 pinctrl-single
pin 11 (PIN11) 27:gpio-0-31 44e1082c 00000027 pinctrl-single
pin 12 (PIN12) 12:gpio-32-63 44e10830 00000027 pinctrl-single
pin 13 (PIN13) 13:gpio-32-63 44e10834 00000027 pinctrl-single
pin 14 (PIN14) 14:gpio-32-63 44e10838 00000027 pinctrl-single
pin 15 (PIN15) 15:gpio-32-63 44e1083c 00000027 pinctrl-single
pin 16 (PIN16) 16:gpio-32-63 44e10840 00000027 pinctrl-single
pin 17 (PIN17) 17:gpio-32-63 44e10844 00000027 pinctrl-single
pin 18 (PIN18) 18:gpio-32-63 44e10848 00000027 pinctrl-single
pin 19 (PIN19) 19:gpio-32-63 44e1084c 00000027 pinctrl-single
pin 20 (PIN20) 20:gpio-32-63 44e10850 00000027 pinctrl-single
pin 21 (PIN21) 21:gpio-32-63 44e10854 00000007 pinctrl-single
pin 22 (PIN22) 22:gpio-32-63 44e10858 00000017 pinctrl-single
pin 23 (PIN23) 23:gpio-32-63 44e1085c 00000007 pinctrl-single
pin 24 (PIN24) 24:gpio-32-63 44e10860 00000017 pinctrl-single
pin 25 (PIN25) 25:gpio-32-63 44e10864 00000027 pinctrl-single
pin 26 (PIN26) 26:gpio-32-63 44e10868 00000027 pinctrl-single
pin 27 (PIN27) 27:gpio-32-63 44e1086c 00000007 pinctrl-single
pin 28 (PIN28) 30:gpio-0-31 44e10870 00000037 pinctrl-single
pin 29 (PIN29) 31:gpio-0-31 44e10874 00000037 pinctrl-single
pin 30 (PIN30) 28:gpio-32-63 44e10878 00000037 pinctrl-single
pin 31 (PIN31) 29:gpio-32-63 44e1087c 00000037 pinctrl-single
pin 32 (PIN32) 30:gpio-32-63 44e10880 00000032 pinctrl-single
pin 33 (PIN33) 31:gpio-32-63 44e10884 00000032 pinctrl-single
pin 34 (PIN34) 0:gpio-64-95 44e10888 00000037 pinctrl-single
pin 35 (PIN35) 1:gpio-64-95 44e1088c 00000027 pinctrl-single
pin 36 (PIN36) 2:gpio-64-95 44e10890 00000037 pinctrl-single
pin 37 (PIN37) 3:gpio-64-95 44e10894 00000037 pinctrl-single
pin 38 (PIN38) 4:gpio-64-95 44e10898 00000037 pinctrl-single
pin 39 (PIN39) 5:gpio-64-95 44e1089c 00000037 pinctrl-single
pin 40 (PIN40) 6:gpio-64-95 44e108a0 00000008 pinctrl-single
pin 41 (PIN41) 7:gpio-64-95 44e108a4 00000008 pinctrl-single
pin 42 (PIN42) 8:gpio-64-95 44e108a8 00000008 pinctrl-single
pin 43 (PIN43) 9:gpio-64-95 44e108ac 00000008 pinctrl-single
pin 44 (PIN44) 10:gpio-64-95 44e108b0 00000008 pinctrl-single
pin 45 (PIN45) 11:gpio-64-95 44e108b4 00000008 pinctrl-single
pin 46 (PIN46) 12:gpio-64-95 44e108b8 00000008 pinctrl-single
pin 47 (PIN47) 13:gpio-64-95 44e108bc 00000008 pinctrl-single
pin 48 (PIN48) 14:gpio-64-95 44e108c0 00000008 pinctrl-single
pin 49 (PIN49) 15:gpio-64-95 44e108c4 00000008 pinctrl-single
pin 50 (PIN50) 16:gpio-64-95 44e108c8 00000008 pinctrl-single
pin 51 (PIN51) 17:gpio-64-95 44e108cc 00000008 pinctrl-single
pin 52 (PIN52) 8:gpio-0-31 44e108d0 00000008 pinctrl-single
pin 53 (PIN53) 9:gpio-0-31 44e108d4 00000008 pinctrl-single
pin 54 (PIN54) 10:gpio-0-31 44e108d8 00000008 pinctrl-single
pin 55 (PIN55) 11:gpio-0-31 44e108dc 00000008 pinctrl-single
pin 56 (PIN56) 22:gpio-64-95 44e108e0 00000000 pinctrl-single
pin 57 (PIN57) 23:gpio-64-95 44e108e4 00000000 pinctrl-single
pin 58 (PIN58) 24:gpio-64-95 44e108e8 00000000 pinctrl-single
pin 59 (PIN59) 25:gpio-64-95 44e108ec 00000000 pinctrl-single
pin 60 (PIN60) 26:gpio-64-95 44e108f0 00000030 pinctrl-single
pin 61 (PIN61) 27:gpio-64-95 44e108f4 00000030 pinctrl-single
pin 62 (PIN62) 28:gpio-64-95 44e108f8 00000030 pinctrl-single
pin 63 (PIN63) 29:gpio-64-95 44e108fc 00000030 pinctrl-single
pin 64 (PIN64) 30:gpio-64-95 44e10900 00000030 pinctrl-single
pin 65 (PIN65) 31:gpio-64-95 44e10904 00000030 pinctrl-single
pin 66 (PIN66) 0:gpio-96-127 44e10908 00000027 pinctrl-single
pin 67 (PIN67) 1:gpio-96-127 44e1090c 00000027 pinctrl-single
pin 68 (PIN68) 2:gpio-96-127 44e10910 00000030 pinctrl-single
pin 69 (PIN69) 3:gpio-96-127 44e10914 00000000 pinctrl-single
pin 70 (PIN70) 4:gpio-96-127 44e10918 00000030 pinctrl-single
pin 71 (PIN71) 16:gpio-0-31 44e1091c 00000000 pinctrl-single
pin 72 (PIN72) 17:gpio-0-31 44e10920 00000000 pinctrl-single
pin 73 (PIN73) 21:gpio-0-31 44e10924 00000000 pinctrl-single
pin 74 (PIN74) 28:gpio-0-31 44e10928 00000000 pinctrl-single
pin 75 (PIN75) 7:gpio-96-127 44e1092c 00000030 pinctrl-single
pin 76 (PIN76) 8:gpio-96-127 44e10930 00000030 pinctrl-single
pin 77 (PIN77) 18:gpio-64-95 44e10934 00000030 pinctrl-single
pin 78 (PIN78) 19:gpio-64-95 44e10938 00000030 pinctrl-single
pin 79 (PIN79) 20:gpio-64-95 44e1093c 00000030 pinctrl-single
pin 80 (PIN80) 21:gpio-64-95 44e10940 00000030 pinctrl-single
pin 81 (PIN81) 29:gpio-0-31 44e10944 00000027 pinctrl-single
pin 82 (PIN82) 0:gpio-0-31 44e10948 00000030 pinctrl-single
pin 83 (PIN83) 1:gpio-0-31 44e1094c 00000010 pinctrl-single
pin 84 (PIN84) 2:gpio-0-31 44e10950 00000037 pinctrl-single
pin 85 (PIN85) 3:gpio-0-31 44e10954 00000037 pinctrl-single
pin 86 (PIN86) 4:gpio-0-31 44e10958 00000037 pinctrl-single
pin 87 (PIN87) 5:gpio-0-31 44e1095c 00000037 pinctrl-single
pin 88 (PIN88) 6:gpio-0-31 44e10960 0000002f pinctrl-single
pin 89 (PIN89) 7:gpio-0-31 44e10964 00000027 pinctrl-single
pin 90 (PIN90) 8:gpio-32-63 44e10968 00000017 pinctrl-single
pin 91 (PIN91) 9:gpio-32-63 44e1096c 00000037 pinctrl-single
pin 92 (PIN92) 10:gpio-32-63 44e10970 00000030 pinctrl-single
pin 93 (PIN93) 11:gpio-32-63 44e10974 00000000 pinctrl-single
pin 94 (PIN94) 12:gpio-0-31 44e10978 00000033 pinctrl-single
pin 95 (PIN95) 13:gpio-0-31 44e1097c 00000033 pinctrl-single
pin 96 (PIN96) 14:gpio-0-31 44e10980 00000037 pinctrl-single
pin 97 (PIN97) 15:gpio-0-31 44e10984 00000037 pinctrl-single
pin 98 (PIN98) 5:gpio-96-127 44e10988 00000030 pinctrl-single
pin 99 (PIN99) 6:gpio-96-127 44e1098c 00000030 pinctrl-single
pin 100 (PIN100) 14:gpio-96-127 44e10990 00000000 pinctrl-single
pin 101 (PIN101) 15:gpio-96-127 44e10994 00000010 pinctrl-single
pin 102 (PIN102) 16:gpio-96-127 44e10998 00000027 pinctrl-single
pin 103 (PIN103) 17:gpio-96-127 44e1099c 00000002 pinctrl-single
pin 104 (PIN104) 18:gpio-96-127 44e109a0 00000027 pinctrl-single
pin 105 (PIN105) 19:gpio-96-127 44e109a4 00000027 pinctrl-single
pin 106 (PIN106) 20:gpio-96-127 44e109a8 00000027 pinctrl-single
pin 107 (PIN107) 21:gpio-96-127 44e109ac 00000030 pinctrl-single
pin 108 (PIN108) 19:gpio-0-31 44e109b0 00000017 pinctrl-single
pin 109 (PIN109) 20:gpio-0-31 44e109b4 00000027 pinctrl-single
pin 110 (PIN110) 0:? 44e109b8 00000030 pinctrl-single
pin 111 (PIN111) 0:? 44e109bc 00000028 pinctrl-single
pin 112 (PIN112) 0:? 44e109c0 00000030 pinctrl-single
pin 113 (PIN113) 0:? 44e109c4 00000028 pinctrl-single
pin 114 (PIN114) 0:? 44e109c8 00000028 pinctrl-single
pin 115 (PIN115) 0:? 44e109cc 00000028 pinctrl-single
pin 116 (PIN116) 0:? 44e109d0 00000030 pinctrl-single
pin 117 (PIN117) 0:? 44e109d4 00000030 pinctrl-single
pin 118 (PIN118) 0:? 44e109d8 00000030 pinctrl-single
pin 119 (PIN119) 0:? 44e109dc 00000030 pinctrl-single
pin 120 (PIN120) 0:? 44e109e0 00000020 pinctrl-single
pin 121 (PIN121) 0:? 44e109e4 00000030 pinctrl-single
pin 122 (PIN122) 0:? 44e109e8 00000030 pinctrl-single
pin 123 (PIN123) 0:? 44e109ec 00000028 pinctrl-single
pin 124 (PIN124) 0:? 44e109f0 00000028 pinctrl-single
pin 125 (PIN125) 0:? 44e109f4 00000028 pinctrl-single
pin 126 (PIN126) 0:? 44e109f8 00000030 pinctrl-single
pin 127 (PIN127) 0:? 44e109fc 00000028 pinctrl-single
pin 128 (PIN128) 0:? 44e10a00 00000028 pinctrl-single
pin 129 (PIN129) 0:? 44e10a04 00000020 pinctrl-single
pin 130 (PIN130) 0:? 44e10a08 00000028 pinctrl-single
pin 131 (PIN131) 0:? 44e10a0c 00000028 pinctrl-single
pin 132 (PIN132) 0:? 44e10a10 00000028 pinctrl-single
pin 133 (PIN133) 0:? 44e10a14 00000028 pinctrl-single
pin 134 (PIN134) 0:? 44e10a18 00000028 pinctrl-single
pin 135 (PIN135) 18:gpio-0-31 44e10a1c 00000020 pinctrl-single
pin 136 (PIN136) 0:? 44e10a20 00000028 pinctrl-single
pin 137 (PIN137) 0:? 44e10a24 00000028 pinctrl-single
pin 138 (PIN138) 0:? 44e10a28 00000028 pinctrl-single
pin 139 (PIN139) 0:? 44e10a2c 00000028 pinctrl-single
pin 140 (PIN140) 0:? 44e10a30 00000028 pinctrl-single
pin 141 (PIN141) 13:gpio-96-127 44e10a34 00000020 pinctrl-single
```

المكان دا فى دبيان مليان حاجات انا مش عارف هى ايه: lib/firmware