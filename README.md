rubypop
=======

Ruby testing framework that utilizes Selenium and the page object pattern.

servers
-------
* **hub** : java -jar selenium-server-standalone-2.33.0.jar -role hub
* **node** : java -jar selenium-server-standalone-2.33.0.jar -role node -hub http://[IP ADDRESS]:4444/grid/register -browser browserName=firefox,platform=LINUX,maxInstances=1

options
-------
* **THREADS** : how many files to run in parallel
* **PROCESSESS** : how many tests within a file to run in parallel
* **FILES** : which files to execute tests against
* **EXAMPLE** : regular expression that can target a specific test
* **TARGET** : specify a remote Selenium server to run tests on

example commands
-------
* rake -T
* rake FILES=location.rb
* rake FILES=name.rb
* rake THREADS=1 PROCESSES=1
* rake THREADS=2 PROCESSES=5
