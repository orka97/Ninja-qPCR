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
L Ninja-qPCR:5-5530843-0 J1
U 1 1 5F0560A4
P 3450 3150
F 0 "J1" H 3450 3817 50  0000 C CNN
F 1 "5-5530843-0" H 3450 3726 50  0000 C CNN
F 2 "Ninja-qPCR:TE_5-5530843-0" H 3450 3150 50  0001 L BNN
F 3 "F8" H 3450 3150 50  0001 L BNN
F 4 "TE Connectivity" H 3450 3150 50  0001 L BNN "Field4"
F 5 "Manufacturer recommendations" H 3450 3150 50  0001 L BNN "Field5"
	1    3450 3150
	1    0    0    -1  
$EndComp
$Comp
L Ninja-qPCR:7-5530843-6 J2
U 1 1 5F056DB9
P 5950 3250
F 0 "J2" H 5950 3915 50  0000 C CNN
F 1 "7-5530843-6" H 5950 3824 50  0000 C CNN
F 2 "Ninja-qPCR:TE_7-5530843-6" H 5950 3250 50  0001 C CNN
F 3 "" H 5950 3250 50  0001 C CNN
	1    5950 3250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5F05781B
P 6150 4600
F 0 "J3" H 6258 4781 50  0000 C CNN
F 1 "Conn_01x02_Male" H 6258 4690 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 6150 4600 50  0001 C CNN
F 3 "~" H 6150 4600 50  0001 C CNN
	1    6150 4600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5F057E95
P 6150 5400
F 0 "J5" H 6258 5581 50  0000 C CNN
F 1 "Conn_01x02_Male" H 6258 5490 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 6150 5400 50  0001 C CNN
F 3 "~" H 6150 5400 50  0001 C CNN
	1    6150 5400
	1    0    0    -1  
$EndComp
Text GLabel 6600 4600 2    50   Input ~ 0
HEATER1_A
Text GLabel 6600 4700 2    50   Input ~ 0
HEATER1_B
Wire Wire Line
	6600 4600 6350 4600
Wire Wire Line
	6600 4700 6350 4700
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 5F059295
P 6150 5000
F 0 "J4" H 6258 5181 50  0000 C CNN
F 1 "Conn_01x02_Male" H 6258 5090 50  0000 C CNN
F 2 "Ninja-qPCR:TB_SeeedOPL_320110028" H 6150 5000 50  0001 C CNN
F 3 "~" H 6150 5000 50  0001 C CNN
	1    6150 5000
	1    0    0    -1  
$EndComp
Text GLabel 6600 5000 2    50   Input ~ 0
HEATER2_A
Text GLabel 6600 5100 2    50   Input ~ 0
HEATER2_B
Wire Wire Line
	6600 5000 6350 5000
Wire Wire Line
	6600 5100 6350 5100
Text GLabel 6600 5500 2    50   Input ~ 0
WELL_THERM_B
Text GLabel 6600 5400 2    50   Input ~ 0
WELL_THERM_A
Wire Wire Line
	6350 5400 6600 5400
Wire Wire Line
	6350 5500 6600 5500
Text GLabel 5300 2850 0    50   Input ~ 0
LED_VCC
Text GLabel 5300 2950 0    50   Input ~ 0
LED_OUT1
Text GLabel 5300 3050 0    50   Input ~ 0
LED_OUT3
Text GLabel 5300 3150 0    50   Input ~ 0
LED_OUT5
Text GLabel 5300 3250 0    50   Input ~ 0
LED_OUT7
Text GLabel 5300 3350 0    50   Input ~ 0
GND
Text GLabel 6600 2850 2    50   Input ~ 0
GND
Text GLabel 6600 2950 2    50   Input ~ 0
LED_OUT2
Text GLabel 6600 3050 2    50   Input ~ 0
LED_OUT4
Text GLabel 6600 3150 2    50   Input ~ 0
LED_OUT6
Text GLabel 6600 3250 2    50   Input ~ 0
LED_OUT8
Text GLabel 6600 3350 2    50   Input ~ 0
GND
Wire Wire Line
	6600 3350 6350 3350
Wire Wire Line
	6600 3250 6350 3250
Wire Wire Line
	6600 3150 6350 3150
Wire Wire Line
	6600 3050 6350 3050
Wire Wire Line
	6600 2950 6350 2950
Wire Wire Line
	6600 2850 6350 2850
Wire Wire Line
	5550 2850 5300 2850
Wire Wire Line
	5550 2950 5300 2950
Wire Wire Line
	5550 3050 5300 3050
Wire Wire Line
	5550 3150 5300 3150
Wire Wire Line
	5550 3250 5300 3250
Wire Wire Line
	5550 3350 5300 3350
Text GLabel 2850 2750 0    50   Input ~ 0
GND
Text GLabel 2850 2850 0    50   Input ~ 0
PD_OUT1
Text GLabel 2850 2950 0    50   Input ~ 0
PD_OUT3
Text GLabel 2850 3050 0    50   Input ~ 0
PD_OUT5
Text GLabel 2850 3150 0    50   Input ~ 0
PD_OUT7
Text GLabel 2850 3250 0    50   Input ~ 0
PD_OUT9
Text GLabel 2850 3350 0    50   Input ~ 0
PD_OUT11
Text GLabel 2850 3450 0    50   Input ~ 0
PD_OUT13
Text GLabel 2850 3550 0    50   Input ~ 0
PD_OUT15
Text GLabel 2850 3650 0    50   Input ~ 0
GND
Text GLabel 4050 2750 2    50   Input ~ 0
GND
Text GLabel 4050 2850 2    50   Input ~ 0
PD_OUT2
Text GLabel 4050 2950 2    50   Input ~ 0
PD_OUT4
Text GLabel 4050 3050 2    50   Input ~ 0
PD_OUT6
Text GLabel 4050 3150 2    50   Input ~ 0
PD_OUT8
Text GLabel 4050 3250 2    50   Input ~ 0
PD_OUT10
Text GLabel 4050 3350 2    50   Input ~ 0
PD_OUT12
Text GLabel 4050 3450 2    50   Input ~ 0
PD_OUT14
Text GLabel 4050 3550 2    50   Input ~ 0
PD_OUT16
Text GLabel 4050 3650 2    50   Input ~ 0
GND
Wire Wire Line
	4050 2750 3850 2750
Wire Wire Line
	4050 2850 3850 2850
Wire Wire Line
	4050 2950 3850 2950
Wire Wire Line
	4050 3050 3850 3050
Wire Wire Line
	4050 3150 3850 3150
Wire Wire Line
	4050 3250 3850 3250
Wire Wire Line
	4050 3350 3850 3350
Wire Wire Line
	4050 3450 3850 3450
Wire Wire Line
	4050 3550 3850 3550
Wire Wire Line
	4050 3650 3850 3650
Wire Wire Line
	2850 3650 3050 3650
Wire Wire Line
	2850 3550 3050 3550
Wire Wire Line
	2850 3450 3050 3450
Wire Wire Line
	2850 3350 3050 3350
Wire Wire Line
	2850 3250 3050 3250
Wire Wire Line
	2850 3150 3050 3150
Wire Wire Line
	2850 3050 3050 3050
Wire Wire Line
	2850 2950 3050 2950
Wire Wire Line
	2850 2850 3050 2850
Wire Wire Line
	2850 2750 3050 2750
$EndSCHEMATC
