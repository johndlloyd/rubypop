rubypop
=======

Ruby testing framework that utilizes Selenium and the page object pattern.


Start testing with

HUB:
java -jar selenium-server-standalone-2.33.0.jar -role hub

NODE:
java -jar selenium-server-standalone-2.33.0.jar -role node -hub http://[IP ADDRESS]:4444/grid/register -browser browserName=firefox,platform=LINUX,maxInstances=1
