#!/bin/bash

{
	mkdir -p Build && cd Build
	cmake ..
	sudo make install	
}
