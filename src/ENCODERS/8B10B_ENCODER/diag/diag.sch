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
L New_Library:5B6B U?
U 1 1 5FA880FA
P 6250 3350
F 0 "U?" H 6300 3300 50  0001 C CNN
F 1 "5B6B" H 6150 3423 50  0000 C CNN
F 2 "" H 6300 3300 50  0001 C CNN
F 3 "" H 6300 3300 50  0001 C CNN
	1    6250 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 3500 5150 3500
Wire Wire Line
	5150 3500 5150 3750
Wire Wire Line
	5150 3750 4900 3750
Wire Wire Line
	3550 3450 3550 3000
Wire Wire Line
	7100 3000 7100 3500
Wire Wire Line
	7100 3500 6750 3500
Wire Bus Line
	5550 3750 5400 3750
$Comp
L New_Library:3B4B U?
U 1 1 5FA87CC4
P 4400 3250
F 0 "U?" H 4500 3150 50  0001 C CNN
F 1 "3B4B" H 4325 3273 50  0000 C CNN
F 2 "" H 4500 3150 50  0001 C CNN
F 3 "" H 4500 3150 50  0001 C CNN
	1    4400 3250
	1    0    0    -1  
$EndComp
Wire Bus Line
	3750 3750 3600 3750
Text GLabel 7150 3750 2    50   Input ~ 0
KIN
Wire Wire Line
	7150 3750 7000 3750
Wire Wire Line
	4900 3450 4900 2800
Wire Wire Line
	4900 2800 7000 2800
Wire Wire Line
	7000 2800 7000 3750
Connection ~ 7000 3750
Wire Wire Line
	7000 3750 6750 3750
Wire Wire Line
	3550 3000 7100 3000
Wire Wire Line
	3550 3450 3750 3450
Wire Bus Line
	5400 3750 5400 4400
Wire Bus Line
	3600 3750 3600 4350
Wire Bus Line
	5400 4400 3600 4400
Text GLabel 2950 4350 2    50   Output ~ 0
ABCDEI_FGHJ
Wire Bus Line
	3600 4350 3450 4350
Connection ~ 3600 4350
Wire Bus Line
	3600 4350 3600 4400
Text GLabel 7150 4150 2    50   Input ~ 0
HGF
Text GLabel 7150 4000 2    50   Input ~ 0
EDCBA
Wire Bus Line
	6750 3650 6750 4000
Wire Bus Line
	6750 4000 7150 4000
Wire Bus Line
	7150 4150 4900 4150
Wire Bus Line
	4900 4150 4900 3600
$EndSCHEMATC
