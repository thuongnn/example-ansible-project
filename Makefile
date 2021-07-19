CURRENT_DIR_PATH=$(shell dirname "$0")
ifeq ($(CURRENT_DIR_PATH), .)
	CURRENT_DIR_PATH=$(shell pwd)
endif

init:
	@echo "Init ansible config..."
	@echo "Remove current hosts.ini and create new hosts.ini from template..."
	@rm -rf $(CURRENT_DIR_PATH)/inventory/hosts.ini
	@cp $(CURRENT_DIR_PATH)/inventory/hosts.ini.template $(CURRENT_DIR_PATH)/inventory/hosts.ini
	@echo "Done."

clean:
	@echo "Cleaning..."
	@echo "-> Clean $(CURRENT_DIR_PATH)/logs/*"
	@rm -rf $(CURRENT_DIR_PATH)/logs/*
	@echo "Done."