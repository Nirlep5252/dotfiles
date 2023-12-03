#!/bin/bash

selection=$(hacksaw -f "%x %y %w %h"); epicshot --x11 --clipboard --selection "$selection"
