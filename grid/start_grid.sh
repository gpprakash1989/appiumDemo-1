#!/bin/bash -w
echo  "java -jar selenium-server-standalone-3.5.3.jar -role hub"
ps -ef |grep -w selenium|grep -v grep|awk  '{print $2}'|xargs kill -9 
echo "java -jar $PWD/selenium-server-standalone-3.5.3.jar -role hub -port 4444  "
java -jar $PWD/selenium-server-standalone-3.5.3.jar -role hub -port 4444  &1 > $PWD/../logs/hub.log 
echo "sleep 20 "
sleep 20
echo "sleep 20 done "
ps -ef |grep -w appium|grep -v grep|awk  '{print $2}'|xargs kill -9 
echo  "appium --nodeconfig node4723.json -p 4723"
appium --nodeconfig  node4723.json -p 4723 &1> $PWD/../logs/node4723.log
echo  "appium --nodeconfig node4724 -p 4724"
appium --nodeconfig  node4724.json -p 4724 &1>$PWD/../logs/node4724.log
echo  "appium --nodeconfig node4725 -p 4725"
appium --nodeconfig  node4724.json -p 4725 &1>$PWD/../logs/node4725.log
echo  "appium --nodeconfig node4726 -p 4726"
appium --nodeconfig  node4724.json -p 4726 &1>$PWD/../logs/node4726.log
