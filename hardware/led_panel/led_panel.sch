EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Q_NMOS_GDS Q3
U 1 1 5F986FD8
P 8150 4100
F 0 "Q3" H 8355 4146 50  0000 L CNN
F 1 "IRLZ24NPBF" H 8355 4055 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 8350 4200 50  0001 C CNN
F 3 "~" H 8150 4100 50  0001 C CNN
	1    8150 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q1
U 1 1 5F9872EE
P 7000 4100
F 0 "Q1" H 7205 4146 50  0000 L CNN
F 1 "IRLZ24NPBF" H 7205 4055 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 7200 4200 50  0001 C CNN
F 3 "~" H 7000 4100 50  0001 C CNN
	1    7000 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q5
U 1 1 5F987346
P 9350 4100
F 0 "Q5" H 9555 4146 50  0000 L CNN
F 1 "IRLZ24NPBF" H 9555 4055 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 9550 4200 50  0001 C CNN
F 3 "~" H 9350 4100 50  0001 C CNN
	1    9350 4100
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR03
U 1 1 5F9940CF
P 1800 1500
F 0 "#PWR03" H 1800 1250 50  0001 C CNN
F 1 "Earth" H 1800 1350 50  0001 C CNN
F 2 "" H 1800 1500 50  0001 C CNN
F 3 "~" H 1800 1500 50  0001 C CNN
	1    1800 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR02
U 1 1 5F9942CB
P 1800 900
F 0 "#PWR02" H 1800 750 50  0001 C CNN
F 1 "+12V" H 1815 1073 50  0000 C CNN
F 2 "" H 1800 900 50  0001 C CNN
F 3 "" H 1800 900 50  0001 C CNN
	1    1800 900 
	1    0    0    -1  
$EndComp
Text Notes 1400 650  2    50   ~ 0
Meanwell LPV-100-12
$Comp
L Device:C_Small C1
U 1 1 5F99491D
P 2100 1050
F 0 "C1" H 2192 1096 50  0000 L CNN
F 1 "0.1u" H 2192 1005 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D5.0mm_H7.0mm_P2.00mm" H 2100 1050 50  0001 C CNN
F 3 "~" H 2100 1050 50  0001 C CNN
	1    2100 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5F994A41
P 3450 1050
F 0 "C2" H 3542 1096 50  0000 L CNN
F 1 "1u" H 3542 1005 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D5.0mm_H7.0mm_P2.00mm" H 3450 1050 50  0001 C CNN
F 3 "~" H 3450 1050 50  0001 C CNN
	1    3450 1050
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM317_3PinPackage U2
U 1 1 5F994B4B
P 2700 900
F 0 "U2" H 2700 1142 50  0000 C CNN
F 1 "LM317_3" H 2700 1051 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 2700 1150 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm317.pdf" H 2700 900 50  0001 C CNN
	1    2700 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5F994EAD
P 3050 1050
F 0 "R5" H 3109 1096 50  0000 L CNN
F 1 "4k7" H 3109 1005 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3050 1050 50  0001 C CNN
F 3 "~" H 3050 1050 50  0001 C CNN
	1    3050 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R6
U 1 1 5F995204
P 3050 1350
F 0 "R6" H 3109 1396 50  0000 L CNN
F 1 "1k6" H 3109 1305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3050 1350 50  0001 C CNN
F 3 "~" H 3050 1350 50  0001 C CNN
	1    3050 1350
	1    0    0    -1  
$EndComp
Text Notes 3000 650  0    50   Italic 0
Vo=1.25(1+R2/R1) + (Iadj x R2)\nIadj = 50 uA
Wire Wire Line
	1800 900  2100 900 
Wire Wire Line
	2100 900  2100 950 
Connection ~ 2100 900 
Wire Wire Line
	2100 900  2400 900 
Wire Wire Line
	1800 1500 2100 1500
Wire Wire Line
	3450 1500 3450 1150
Wire Wire Line
	3050 1450 3050 1500
Connection ~ 3050 1500
Wire Wire Line
	3050 1500 3450 1500
Wire Wire Line
	3050 1150 3050 1200
Wire Wire Line
	2700 1200 3050 1200
Connection ~ 3050 1200
Wire Wire Line
	3050 1200 3050 1250
Wire Wire Line
	3000 900  3050 900 
Wire Wire Line
	3050 900  3050 950 
Wire Wire Line
	3050 900  3450 900 
Wire Wire Line
	3450 900  3450 950 
Connection ~ 3050 900 
Wire Wire Line
	2100 1150 2100 1500
Connection ~ 2100 1500
Wire Wire Line
	2100 1500 3050 1500
Wire Notes Line
	500  1700 4550 1700
Wire Notes Line
	4550 1700 4550 500 
$Comp
L power:Earth #PWR01
U 1 1 5F99C6A6
P 7100 4450
F 0 "#PWR01" H 7100 4200 50  0001 C CNN
F 1 "Earth" H 7100 4300 50  0001 C CNN
F 2 "" H 7100 4450 50  0001 C CNN
F 3 "~" H 7100 4450 50  0001 C CNN
	1    7100 4450
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR05
U 1 1 5F99C855
P 8250 4450
F 0 "#PWR05" H 8250 4200 50  0001 C CNN
F 1 "Earth" H 8250 4300 50  0001 C CNN
F 2 "" H 8250 4450 50  0001 C CNN
F 3 "~" H 8250 4450 50  0001 C CNN
	1    8250 4450
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR07
U 1 1 5F99C87C
P 9450 4450
F 0 "#PWR07" H 9450 4200 50  0001 C CNN
F 1 "Earth" H 9450 4300 50  0001 C CNN
F 2 "" H 9450 4450 50  0001 C CNN
F 3 "~" H 9450 4450 50  0001 C CNN
	1    9450 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 4300 7100 4450
Wire Wire Line
	9450 4300 9450 4450
Wire Wire Line
	8100 3250 7100 3250
Wire Wire Line
	8200 3900 8250 3900
Wire Wire Line
	9450 3250 8300 3250
Text Notes 7950 2800 0    50   ~ 0
INPUT from LED\n
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 5F9958C6
P 950 1200
F 0 "J2" H 950 1000 50  0000 C CNN
F 1 "Meanwell LPV-100-12" H 950 1300 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2_1x02_P5.00mm_Horizontal" H 950 1200 50  0001 C CNN
F 3 "~" H 950 1200 50  0001 C CNN
	1    950  1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	1800 1200 1800 1500
Connection ~ 1800 1500
Wire Wire Line
	1150 1100 1300 1100
Wire Wire Line
	1800 1100 1800 900 
Connection ~ 1800 900 
Wire Wire Line
	7100 3250 7100 3900
Wire Wire Line
	9450 3250 9450 3900
$Comp
L Mechanical:MountingHole H1
U 1 1 5F9B86AA
P 10400 5000
F 0 "H1" H 10500 5046 50  0000 L CNN
F 1 "MountingHole" H 10500 4955 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4_DIN965" H 10400 5000 50  0001 C CNN
F 3 "~" H 10400 5000 50  0001 C CNN
	1    10400 5000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5F9B87AA
P 10400 5200
F 0 "H2" H 10500 5246 50  0000 L CNN
F 1 "MountingHole" H 10500 5155 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4_DIN965" H 10400 5200 50  0001 C CNN
F 3 "~" H 10400 5200 50  0001 C CNN
	1    10400 5200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5F9B87EC
P 10400 5400
F 0 "H3" H 10500 5446 50  0000 L CNN
F 1 "MountingHole" H 10500 5355 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4_DIN965" H 10400 5400 50  0001 C CNN
F 3 "~" H 10400 5400 50  0001 C CNN
	1    10400 5400
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5F9B8838
P 10400 5600
F 0 "H4" H 10500 5646 50  0000 L CNN
F 1 "MountingHole" H 10500 5555 50  0000 L CNN
F 2 "MountingHole:MountingHole_4.3mm_M4_DIN965" H 10400 5600 50  0001 C CNN
F 3 "~" H 10400 5600 50  0001 C CNN
	1    10400 5600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x04 J1
U 1 1 5F9BBA06
P 8100 2900
F 0 "J1" V 8066 2612 50  0000 R CNN
F 1 "Screw_Terminal_01x04" V 7975 2612 50  0000 R CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-4_1x04_P5.00mm_Horizontal" H 8100 2900 50  0001 C CNN
F 3 "~" H 8100 2900 50  0001 C CNN
	1    8100 2900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8300 3100 8300 3250
Wire Wire Line
	8200 3100 8200 3900
Wire Wire Line
	8100 3100 8100 3250
$Comp
L power:+12V #PWR09
U 1 1 5F9BEBCD
P 7700 3050
F 0 "#PWR09" H 7700 2900 50  0001 C CNN
F 1 "+12V" H 7715 3223 50  0000 C CNN
F 2 "" H 7700 3050 50  0001 C CNN
F 3 "" H 7700 3050 50  0001 C CNN
	1    7700 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3100 7700 3100
Wire Wire Line
	7700 3100 7700 3050
Wire Notes Line
	500  5550 5050 5550
Wire Notes Line
	5050 5550 5050 7800
$Comp
L modules:Joyit_040_ENCODER SW1
U 1 1 5F9912D5
P 4300 6100
F 0 "SW1" H 4300 6050 50  0000 L CNN
F 1 "JOYIT_040" H 4150 6650 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 4300 6100 50  0001 C CNN
F 3 "" H 4300 6100 50  0001 C CNN
	1    4300 6100
	-1   0    0    1   
$EndComp
$Comp
L modules:OLED U3
U 1 1 5F98CB8D
P 4250 7100
F 0 "U3" H 4250 7050 50  0000 L CNN
F 1 "OLED" H 4250 7550 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 4250 7100 50  0001 C CNN
F 3 "" H 4250 7100 50  0001 C CNN
	1    4250 7100
	-1   0    0    1   
$EndComp
$Comp
L cus:+5V #PWR04
U 1 1 60842AEB
P 3450 900
F 0 "#PWR04" H 3450 750 50  0001 C CNN
F 1 "+5V" H 3465 1073 50  0000 C CNN
F 2 "" H 3450 900 50  0001 C CNN
F 3 "" H 3450 900 50  0001 C CNN
	1    3450 900 
	1    0    0    -1  
$EndComp
Connection ~ 3450 900 
$Comp
L cus:+5V #PWR013
U 1 1 60849BB8
P 2700 6000
F 0 "#PWR013" H 2700 5850 50  0001 C CNN
F 1 "+5V" H 2715 6173 50  0000 C CNN
F 2 "" H 2700 6000 50  0001 C CNN
F 3 "" H 2700 6000 50  0001 C CNN
	1    2700 6000
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR017
U 1 1 6084A813
P 2700 6200
F 0 "#PWR017" H 2700 5950 50  0001 C CNN
F 1 "Earth" H 2700 6050 50  0001 C CNN
F 2 "" H 2700 6200 50  0001 C CNN
F 3 "~" H 2700 6200 50  0001 C CNN
	1    2700 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 6050 2700 6050
Wire Wire Line
	2700 6050 2700 6000
Wire Wire Line
	2600 6150 2700 6150
Wire Wire Line
	2700 6150 2700 6200
Text GLabel 1000 6350 0    39   Input ~ 0
BUTTON
Text GLabel 1000 6550 0    39   Input ~ 0
BLUE
Text GLabel 1000 6650 0    39   Input ~ 0
RED
Text GLabel 1000 6750 0    39   Input ~ 0
GREEN
Text GLabel 1000 7050 0    39   Input ~ 0
ROT-
Text GLabel 1000 7150 0    39   Input ~ 0
ROT+
Text GLabel 1000 7250 0    39   Input ~ 0
SDA
Text GLabel 1000 7350 0    39   Input ~ 0
SCL
NoConn ~ 1000 6250
NoConn ~ 1000 6450
NoConn ~ 1000 6850
NoConn ~ 1000 6950
NoConn ~ 1000 7450
NoConn ~ 2600 6350
NoConn ~ 2600 6250
NoConn ~ 2600 6650
NoConn ~ 2600 6750
NoConn ~ 2600 6850
NoConn ~ 2600 6950
NoConn ~ 2600 7050
NoConn ~ 2600 7150
NoConn ~ 2600 7250
NoConn ~ 2600 7350
NoConn ~ 2600 7450
Text GLabel 3850 6350 0    39   Input ~ 0
BUTTON
Text GLabel 9150 4100 0    39   Input ~ 0
BLUE
Text GLabel 7950 4100 0    39   Input ~ 0
RED
Text GLabel 6800 4100 0    39   Input ~ 0
GREEN
Text GLabel 3850 6450 0    39   Input ~ 0
ROT-
Text GLabel 3850 6550 0    39   Input ~ 0
ROT+
Text GLabel 3800 7250 0    39   Input ~ 0
SCL
Text GLabel 3800 7150 0    39   Input ~ 0
SDA
$Comp
L cus:+3V3 #PWR019
U 1 1 6086F6F3
P 3450 7300
F 0 "#PWR019" H 3450 7150 50  0001 C CNN
F 1 "+3V3" H 3465 7473 50  0000 C CNN
F 2 "" H 3450 7300 50  0001 C CNN
F 3 "" H 3450 7300 50  0001 C CNN
	1    3450 7300
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR020
U 1 1 6086FBA6
P 3450 7500
F 0 "#PWR020" H 3450 7250 50  0001 C CNN
F 1 "Earth" H 3450 7350 50  0001 C CNN
F 2 "" H 3450 7500 50  0001 C CNN
F 3 "~" H 3450 7500 50  0001 C CNN
	1    3450 7500
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR015
U 1 1 608704FA
P 3750 6050
F 0 "#PWR015" H 3750 5800 50  0001 C CNN
F 1 "Earth" H 3750 5900 50  0001 C CNN
F 2 "" H 3750 6050 50  0001 C CNN
F 3 "~" H 3750 6050 50  0001 C CNN
	1    3750 6050
	1    0    0    -1  
$EndComp
$Comp
L cus:+3V3 #PWR014
U 1 1 608714A7
P 3550 6000
F 0 "#PWR014" H 3550 5850 50  0001 C CNN
F 1 "+3V3" H 3565 6173 50  0000 C CNN
F 2 "" H 3550 6000 50  0001 C CNN
F 3 "" H 3550 6000 50  0001 C CNN
	1    3550 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 6150 3850 6000
Wire Wire Line
	3850 6000 3750 6000
Wire Wire Line
	3850 6250 3550 6250
Wire Wire Line
	3550 6250 3550 6000
Wire Wire Line
	3750 6000 3750 6050
Wire Wire Line
	3800 7350 3450 7350
Wire Wire Line
	3450 7350 3450 7300
Wire Wire Line
	3450 7500 3450 7450
Wire Wire Line
	3450 7450 3800 7450
$Comp
L Device:Q_NMOS_GDS Q4
U 1 1 60884B83
P 8100 2000
F 0 "Q4" H 8305 2046 50  0000 L CNN
F 1 "IRLZ24NPBF" H 8305 1955 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 8300 2100 50  0001 C CNN
F 3 "~" H 8100 2000 50  0001 C CNN
	1    8100 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q2
U 1 1 60884B89
P 6950 2000
F 0 "Q2" H 7155 2046 50  0000 L CNN
F 1 "IRLZ24NPBF" H 7155 1955 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 7150 2100 50  0001 C CNN
F 3 "~" H 6950 2000 50  0001 C CNN
	1    6950 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q6
U 1 1 60884B8F
P 9300 2000
F 0 "Q6" H 9505 2046 50  0000 L CNN
F 1 "IRLZ24NPBF" H 9505 1955 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 9500 2100 50  0001 C CNN
F 3 "~" H 9300 2000 50  0001 C CNN
	1    9300 2000
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR08
U 1 1 60884B95
P 7050 2350
F 0 "#PWR08" H 7050 2100 50  0001 C CNN
F 1 "Earth" H 7050 2200 50  0001 C CNN
F 2 "" H 7050 2350 50  0001 C CNN
F 3 "~" H 7050 2350 50  0001 C CNN
	1    7050 2350
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR010
U 1 1 60884B9B
P 8200 2350
F 0 "#PWR010" H 8200 2100 50  0001 C CNN
F 1 "Earth" H 8200 2200 50  0001 C CNN
F 2 "" H 8200 2350 50  0001 C CNN
F 3 "~" H 8200 2350 50  0001 C CNN
	1    8200 2350
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR011
U 1 1 60884BA1
P 9400 2350
F 0 "#PWR011" H 9400 2100 50  0001 C CNN
F 1 "Earth" H 9400 2200 50  0001 C CNN
F 2 "" H 9400 2350 50  0001 C CNN
F 3 "~" H 9400 2350 50  0001 C CNN
	1    9400 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 2200 7050 2350
Wire Wire Line
	8200 2200 8200 2350
Wire Wire Line
	9400 2200 9400 2350
Wire Wire Line
	8050 1150 7050 1150
Wire Wire Line
	8150 1800 8200 1800
Wire Wire Line
	9400 1150 8250 1150
Text Notes 7900 700  0    50   ~ 0
INPUT from LED\n
Wire Wire Line
	7050 1150 7050 1800
Wire Wire Line
	9400 1150 9400 1800
$Comp
L Connector:Screw_Terminal_01x04 J3
U 1 1 60884BB0
P 8050 800
F 0 "J3" V 8016 512 50  0000 R CNN
F 1 "Screw_Terminal_01x04" V 7925 512 50  0000 R CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-4_1x04_P5.00mm_Horizontal" H 8050 800 50  0001 C CNN
F 3 "~" H 8050 800 50  0001 C CNN
	1    8050 800 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8250 1000 8250 1150
Wire Wire Line
	8150 1000 8150 1800
Wire Wire Line
	8050 1000 8050 1150
$Comp
L power:+12V #PWR06
U 1 1 60884BB9
P 7650 950
F 0 "#PWR06" H 7650 800 50  0001 C CNN
F 1 "+12V" H 7665 1123 50  0000 C CNN
F 2 "" H 7650 950 50  0001 C CNN
F 3 "" H 7650 950 50  0001 C CNN
	1    7650 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 1000 7650 1000
Wire Wire Line
	7650 1000 7650 950 
Text GLabel 9100 2000 0    39   Input ~ 0
BLUE
Text GLabel 7900 2000 0    39   Input ~ 0
RED
Text GLabel 6750 2000 0    39   Input ~ 0
GREEN
Wire Notes Line
	3200 6700 5050 6700
Wire Notes Line
	3200 5550 3200 7750
Text Notes 4200 6850 0    47   ~ 0
OLED display 168 x 64
Text Notes 4550 5650 0    47   ~ 0
ROT encoder 
Wire Notes Line
	11200 5950 10200 5950
Wire Notes Line
	10200 5950 10200 4850
Text Notes 10350 5900 0    47   ~ 0
M4
Wire Notes Line
	6250 500  6250 4800
Wire Notes Line
	6250 4800 11200 4800
Text Notes 9600 600  0    47   ~ 0
LED strip connection and MOSFET drivers\n
Wire Wire Line
	8250 4300 8250 4450
$Comp
L cus:+3V3 #PWR0101
U 1 1 608C00EB
P 2850 6450
F 0 "#PWR0101" H 2850 6300 50  0001 C CNN
F 1 "+3V3" H 2865 6623 50  0000 C CNN
F 2 "" H 2850 6450 50  0001 C CNN
F 3 "" H 2850 6450 50  0001 C CNN
	1    2850 6450
	1    0    0    -1  
$EndComp
$Comp
L ESP8266:NodeMCU_1.0_(ESP-12E) U1
U 1 1 6084380D
P 1800 6750
F 0 "U1" H 1800 5663 60  0000 C CNN
F 1 "NodeMCU_1.0_(ESP-12E)" H 1800 5769 60  0000 C CNN
F 2 "ESP8266:ESP12F-Devkit-V3" H 1200 5900 60  0001 C CNN
F 3 "" H 1200 5900 60  0000 C CNN
	1    1800 6750
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 608C87F4
P 1300 1100
F 0 "#FLG0101" H 1300 1175 50  0001 C CNN
F 1 "PWR_FLAG" H 1300 1273 50  0000 C CNN
F 2 "" H 1300 1100 50  0001 C CNN
F 3 "~" H 1300 1100 50  0001 C CNN
	1    1300 1100
	1    0    0    -1  
$EndComp
Connection ~ 1300 1100
Wire Wire Line
	1300 1100 1800 1100
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 608C9449
P 2100 1500
F 0 "#FLG0102" H 2100 1575 50  0001 C CNN
F 1 "PWR_FLAG" H 2100 1673 50  0000 C CNN
F 2 "" H 2100 1500 50  0001 C CNN
F 3 "~" H 2100 1500 50  0001 C CNN
	1    2100 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	1150 1200 1800 1200
NoConn ~ 2600 6550
Wire Wire Line
	2600 6450 2850 6450
NoConn ~ 1000 6050
NoConn ~ 1000 6150
$EndSCHEMATC
