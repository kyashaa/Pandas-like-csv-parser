#!/bin/bash

{
	mkdir -p Build
	cd Build && cd Build
	cmake ..
	sudo make install	
}
