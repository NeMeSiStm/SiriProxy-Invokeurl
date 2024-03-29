require 'cora'
require 'siri_objects'
require 'pp'

#######
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::Invokeurl < SiriProxy::Plugin
  def initialize(config)
    #if you have custom configuration options, process them here!
  end

  listen_for /test Musik/i do
    say "Hallo Michael, Sonos zu PHP funktioniert einwandfrei. Glaube ich zumindest." #say something to the user!

    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
end

#Volume Up "http://milkyway.merkur.local/sonos/index.php?zone=Badezimmer&do=VolumeUp"
#Volume Down "http://milkyway.merkur.local/sonos/index.php?zone=Badezimmer&do=VolumeDown"
#Play/Pause "http://milkyway.merkur.local/sonos/index.php?zone=Badezimmer&do=TogglePlayStop"