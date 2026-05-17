#!/bin/sh
ddcutil -b 5 setvcp 10 "$1"
ddcutil -b 2 setvcp 10 "$1"
