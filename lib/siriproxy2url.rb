require 'cora'
require 'siri_objects'
require 'pp'

#######
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::2url < SiriProxy::Plugin
  def initialize(config)
    #if you have custom configuration options, process them here!
  end

  listen_for /sonos erhoehe Lautstaerke im Badezimmer/i do
    open("http://milkyway.merkur.local/sonos/index.php?zone=Badezimmer&do=VolumeUp")
      
    say "Die Lautstaerke im Badezimmer wurde erhoeht."
      
    request_completed
    #Die Lautstärke wird um einen Punkt erhöht.
  end

  listen_for /sonos veringere Lautstaerke im Badezimmer/i do
    open("http://milkyway.merkur.local/sonos/index.php?zone=Badezimmer&do=VolumeDown")
    
    say "Die Lautstaerke im Badezimmer wurde verringert."
    
    request_completed
    #Die Lautstärke wird um einen Punkt verringert.
  end

  listen_for /sonos starte die Wiedergabe im Badezimmer/i do
    open("http://milkyway.merkur.local/sonos/index.php?zone=Badezimmer&do=Play")
    
    say "Die Musik im Badezimmer wurde gestartet."
    
    request_completed
    #Musik im Badezimmer Ein.
  end

  listen_for /sonos/i do
    say "Hallo Michael, Sonos zu PHP funktioniert einwandfrei. Glaube ich zumindest." #say something to the user!

    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
end

#Volume Up "http://milkyway.merkur.local/sonos/index.php?zone=Badezimmer&do=VolumeUp"
#Volume Down "http://milkyway.merkur.local/sonos/index.php?zone=Badezimmer&do=VolumeDown"
#Play/Pause "http://milkyway.merkur.local/sonos/index.php?zone=Badezimmer&do=TogglePlayStop"