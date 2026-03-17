@echo off
cd ..\..\tools\bin

q3map -samplesize 18 ../../main/maps/zh_elusive
REM Remove the below "REM" when ready to compile lights/flares, it can take multiple hours.
REM flare -verbose -dumpoptions ../../main/maps/zh_elusive

pause