

- [x] ~~BeagleBone Black (BBB) or BeagleBone AI (main development board)~~  
- [x] ~~USB cable (for power and communication)~~  
- [x] ~~MicroSD card (minimum 8GB, for flashing operating systems)~~

Prototyping and Wiring

- [x] ~~Breadboard (1 or **2** for prototyping)~~  
      One big, one small is enough imo  
- [x] ~~Prototype PCBs different sizes~~  
- [x] ~~If you don’t know how to solder, buy a kit, e.g. a radio. It comes with all components and a manual~~  
- [x] ~~Jumper wires (male-to-male, male-to-female, female-to-female)~~

		\- Buy ones Silicon isolation. Much better

- [ ] Dupont connectors (optional, for custom wiring)  
- [ ] Terminal blocks (optional, for secure connections)  
- Useful

Resistors

- [x] ~~Various values: 220Ω, 330Ω, 1kΩ, 4.7kΩ, 10kΩ, 100kΩ, 1MΩ, 2.2KΩ, 2x10KΩ, 50kΩ, 100Ω, 50Ω, 1KΩ, 470Ω, 100KΩ POT~~  
- **You can buy it in a book. Much more tidy**  
- [x] ~~Generic light-dependent resistor~~

Capacitors

- [x] ~~Various values: 0.33µF, 01µF, 1nF, 10nF, 100nF, 1µF, 10µF, 100µF, electrolytic and ceramic)~~

LEDs and Displays

- [x] ~~Standard LEDs (red, green, blue, yellow; 5mm or 3mm)~~  
- [x] ~~RGB LEDs (common anode or cathode)~~  
- [x] ~~7-segment displays (single and/or multi-digit)~~  
      - [x] ~~MAX7219 seven segment~~  
- [x] ~~LCD display (e.g., 16x2 with I2C interface)~~  
- I used mine twice or so and then never again. Get a ssd1307 or similar. Also available with I2C and you can use it as framebuffer in Linux or barebox

Switches and Input Devices

- [x] ~~Tactile push-button switches~~  
- [x] ~~Toggle switches~~  
- [x] ~~Potentiometers (10kΩ or similar)~~  
- [ ] Keypad matrix (optional)  
- Never used mine  
- [ ] Button and Switch: General purpose SPST and SPDT

Sensors

- [x] ~~Temperature sensor (e.g., LM35 or DHT11)~~  
- [x] ~~Light-dependent resistor (LDR)~~  
- [x] ~~Ultrasonic distance sensor: HC-SR04~~  
- [x] ~~Sharp infrared distance sensor~~  
- [x] ~~Op-amps: LM358, MCP6002/4~~  
- [ ] TMP36 temperature sensor  
- [x] ~~MCP3208 SPI ADC~~  
- [x] ~~ADXL345 and ADXL335 and MPU6050 accelerometer~~  
- [x] ~~MCP23017, MCP23S17 I2C GPIO Expander~~  
- [x] ~~USB UART: CP2102 or CH340G~~

Integrated Circuits (ICs)

- [x] ~~Shift registers (e.g., 74HC595)~~  
- [x] ~~Multiplexer/demultiplexer (e.g., CD4051 or 74HC4051)~~  
- [x] ~~Analog-to-digital converter (ADC; e.g., MCP3008)~~  
- [ ] Digital-to-analog converter (DAC; optional)  
- [x] ~~IC 74HC73N~~  
- [x] ~~IC 74HC03N~~  
- [x] ~~IC 74LS08N~~  
- [x] ~~IC 74HC08N~~  
- [x] ~~IC 74HC14~~  
- [x] ~~IC LM358N~~  
- [x] ~~Optoisolator SFH617A~~  
- [x] ~~DS3231 RTC~~  
- [x] ~~74HC595 Shift register~~  
- [x] ~~GY-GPS6MV2 (low cost UART GPS receiver)~~  
- [ ] SN65HVD230 (Low cost physical layer CAN Bus module)  
      This is only the transceiver, you still need a CAN controller  
      Maybe get a mikrobus module for the beagleplay instead? You need another device (or a car) on the other side of the CAN bus to do something useful with it.  
- [x] ~~LCD character display module~~

Diodes and Transistors

- [x] ~~General-purpose diodes (1N4001, 1N4148, 1N4007)~~  
- [x] ~~NPN transistors: 2N2222, BC547, FET: BS270~~  
- [x] ~~PNP transistors (e.g., BC557)~~  
- [x] ~~MOSFETs (e.g., IRF540, IRLZ44N)~~  
- [ ] PTC: 60R110

Power Components

- [x] ~~Voltage regulators: LM7805, LM317, KA7805~~  
      I never used those except in university in Egypt  
- [x] ~~DC barrel jack connectors~~  
      Useful  
- [ ] Battery holders (e.g., AA, 9V)  
      Useful  
- [ ] Power supply module (optional, for breadboard)  
      There are USB-C trigger boards (untested by me):  
      [https://de.aliexpress.com/item/1005006991524285.html?spm=a2g0o.order\_list.order\_list\_main.5.5eb35c5f7FVMC0\&gatewayAdapt=glo2deu](https://de.aliexpress.com/item/1005006991524285.html?spm=a2g0o.order_list.order_list_main.5.5eb35c5f7FVMC0&gatewayAdapt=glo2deu)  
      These have a DIP switch to configure what voltage output it should negotiate  
      Upside is being able to use a normal Type C PD power supply instead  
      

Communication Modules

- [x] ~~I2C modules (e.g., RTC like DS1307)~~  
- [x] ~~UART to USB converter module~~  
- [x] ~~SPI/I2C breakout boards (optional)~~  
- [x] ~~Ethernet cable (if applicable)~~

Motors and Actuators

- [ ] Servo motor  
      - [x] ~~SG90~~  
      - [ ] MG996R  
      - [ ] Hitec HS-422 Servo  
- [x] ~~DC motor with driver module (e.g., L298N)~~  
      - [x] ~~H-bridge interface board~~  
- [x] ~~Stepper motor with driver (e.g., ULN2003)~~

Miscellaneous

- [x] ~~Buzzer or piezo speaker~~  
      ~~I have one from an old motherboard in egypt. They’re fun~~  
- [ ] Heat sink (optional, for power components)  
- [ ] Dupont connectors (male/female headers)  
- [ ] Screwdriver set (precision)  
- [x] ~~Multimeter (for measurements and debugging, DMM)~~  
- [ ] Oscilloscope  
- [ ] Signal generator  
- [ ] Soldering kit (optional, for advanced projects)  
      There’s USB-C soldering irons, which I’d probably go for if I didn’t already have one  
- [ ] Adhesive materials (double-sided tape, glue)  
- [x] ~~Arduino~~  
- [x] ~~Arduino starter kit~~  
- [x] ~~Relay 5V~~  
- [x] ~~NodeMCU Microprocessor: ESP8266 version 2~~  
- [ ] ZigBee modules: Digi XBee S2/S2C ZigBee module  
- [ ] SparkFun XBee Explorer USB  
- [x] ~~An RFID card reader: PN532 NFC compatible~~  
- [ ] Linux USB webcam  
- [ ] USB audio and/or Bluetooth adapter  
- [ ] FTDI cable  
- [ ]   
- [ ] عايز اشترى container للالكترونيات  
      Kleinteilmagazin im Baumarkt  
- [x] ~~ادوات لحام احترافيه, مش رخيصه~~  
- [ ] ملتيميتر  
- [ ] اشترى اوسيلسكوب  
- [ ] اشترى Digilent Discovery

- [x] [https://uart-adapter.com/](https://uart-adapter.com/)  
- [ ] [https://pine64.com/product/pinecil-smart-mini-portable-soldering-iron/](https://pine64.com/product/pinecil-smart-mini-portable-soldering-iron/)  
- [ ] 

---
- [x] D-link (DUB-H7) (840356736006) 7-Port
      لازم الـ hardware revision دا تحديداً علشان التحكم عن بُعد بـ uhubctl مدعوم هنا بس
      https://www.ebay.de/p/154014222
- [x] Sigrok compatible logic analyzer https://sigrok.org/wiki/Supported_hardware#Logic_analyzers
	- [x] Hantek 6022BL digitales Oszilloskop mit USB-Anschluss, 2 Digital- und 16 Logik-Kanäle
- [x] UNI-T UT890C Professionelles Digital Multimeter
- [x] WS2812B Matrix LED Panel Modul mit individuell adressierbaren RGB LED Pixels
- [ ] RK3566 Handheld
      https://powkiddy.com/products/pre-sale-powkiddy-rgb30-rk3566-handheld-game-console-built-in-wifi
- [ ] Cheap imx board: https://linuxgizmos.com/debix-model-b-sbc-targets-industrial-applications/
- [x] conecto, Hohlstecker-Adapter, Niedervolt-Ladekabel, 2.5mm Hohlstecker auf USB Typ A Stecker, 60cm, schwarz
