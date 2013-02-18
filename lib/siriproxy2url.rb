require 'cora'
require 'siri_objects'
require 'pp'

#######
# This is a "hello world" style plugin. It simply intercepts the phrase "test siri proxy" and responds
# with a message about the proxy being up and running (along with a couple other core features). This
# is good base code for other plugins.
#
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::2url < SiriProxy::Plugin
  def initialize(config)
    #if you have custom configuration options, process them here!
  end

  #get the user's location and display it in the logs
  #filters are still in their early stages. Their interface may be modified
  filter "SetRequestOrigin", direction: :from_iphone do |object|
    puts "[Info - User Location] lat: #{object["properties"]["latitude"]}, long: #{object["properties"]["longitude"]}"

    #Note about returns from filters:
    # - Return false to stop the object from being forwarded
    # - Return a Hash to substitute or update the object
    # - Return nil (or anything not a Hash or false) to have the object forwarded (along with any
    #    modifications made to it)
  end

  listen_for /sonos erhöhe Lautstärke im Badezimmer/i do
    open("http://milkyway.merkur.local/sonos/index.php?zone=Badezimmer&do=VolumeUp")
      
    say "Die Lautstärke im Badezimmer wurde erhöht."
      
    request_completed
    #Die Lautstärke wird um einen Punkt erhöht.
  end

listen_for /sonos veringere Lautstärke im Badezimmer/i do
    open("http://milkyway.merkur.local/sonos/index.php?zone=Badezimmer&do=VolumeDown")
    
    say "Die Lautstärke im Badezimmer wurde verringert."
    
    request_completed
    #Die Lautstärke wird um einen Punkt verringert.
end

listen_for /sonos starte die Wiedergabe im Badezimmer/i do
    open("http://milkyway.merkur.local/sonos/index.php?zone=Badezimmer&do=Play")
    
    say "Die Musik im Badezimmer wurde gestartet."
    
    request_completed
    #Musik im Badezimmer Ein.
end

  listen_for /test sonos/i do
    say "Hallo Michael, Sonos zu PHP funktioniert einwandfrei. Glaube ich zumindest." #say something to the user!

    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

  #Demonstrate that you can have Siri say one thing and write another"!
  listen_for /you don't say/i do
    say "Sometimes I don't write what I say", spoken: "Sometimes I don't say what I write"
  end
end

#Volume Up "http://milkyway.merkur.local/sonos/index.php?zone=Badezimmer&do=VolumeUp"
#Volume Down "http://milkyway.merkur.local/sonos/index.php?zone=Badezimmer&do=VolumeDown"
#Play/Pause "http://milkyway.merkur.local/sonos/index.php?zone=Badezimmer&do=TogglePlayStop"