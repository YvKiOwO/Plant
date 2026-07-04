INSTALL_PATH = /usr/local/bin

all: install

install:
	@echo "Installing patched wormhole-william..."
	@sudo cp bin/plant-engine $(INSTALL_PATH)/plant-engine
	@sudo chmod +x $(INSTALL_PATH)/plant-engine

	@echo "Compiling plant..."
	@nasm -f elf64 src/main.asm -o plant.o
	@ld plant.o -o plant
	
	@echo "Moving plant to global path..."
	@sudo mv plant $(INSTALL_PATH)/plant
	@echo "---"
	@echo "installation complete. You can now run "plant send filename""

clean:
	@rm -rf plant.o
	@sudo rm -rf $(INSTALL_PATH)/plant $(INSTALL_PATH)/plant-engine
