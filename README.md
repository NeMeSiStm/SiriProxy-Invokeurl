siriproxy-Invokeurl
=============

THIS PLUGIN IS IN ALPHA STATE AND ONLY FOR PRIVATE TESTING

The is a Plugin for Siriproxy to open URLs like php links to control something


Installing:
=============

insert the following 2 lines to your config.yml

*   - name: '2url'
*     git: 'git://github.com/NeMeSiStm/SiriProxy-Invokeurl.git'
*     base_url: 'http://Server_Adress/folder/index.php' #Example http://192.168.0.10/sonos/index.php (not implemented yet)



stop SiriProxy (CTRL + C)

execute: siriproxy update

execute: bundle install

execute: rvmsudo siriproxy server
