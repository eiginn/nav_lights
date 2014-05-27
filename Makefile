BOARD_TAG   = micro
ARDUINO_DIR = ~/arduino-1.5.6-r2
PORT        = /dev/ttyACM0
FILE        = nav_lights.pde

.PHONY: all verify upload
all: upload

verify:
	@$(ARDUINO_DIR)/arduino --board arduino:avr:$(BOARD_TAG) --verify $(FILE)

upload:
	@$(ARDUINO_DIR)/arduino --board arduino:avr:$(BOARD_TAG) --port $(PORT) --upload $(FILE)
