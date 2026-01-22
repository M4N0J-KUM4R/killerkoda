#!/bin/bash
grep "INSTANT" lifecycle.txt
docker ps -a | grep stubborn-app | grep Exited
