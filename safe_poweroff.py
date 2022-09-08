#!/usr/bin/python3

import RPi.GPIO as GPIO
import time
import os

signalPin = 16
debounceWait = 5

GPIO.setmode(GPIO.BOARD)
GPIO.setup(signalPin, GPIO.IN)

while True:
	# Wait for power to drop.
	print ("Waiting for power loss...");
	GPIO.wait_for_edge(signalPin, GPIO.FALLING)
	print ("Power loss")

	# Give user 5 seconds to restore power.
	print ("Waiting to see if power is restored...")
	time.sleep(debounceWait)

	if GPIO.input(signalPin) == 0:
		print ("Power not restored.")
		os.system("sudo shutdown -h now")
		break;
	else:
		print ("Power restored.")
