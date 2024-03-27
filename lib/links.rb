
class Links
    def initialize
      @links = {}
      @links[:products] = {}
      @links[:products][:overview] = "/about"
      @links[:products][:player] = "/player"
      @links[:products][:editor] = "/editor"
      @links[:products][:rtp] = "/rtp-replacement"
      @links[:products][:tools] = "/tools"
      @links[:downloads] = {}
      @links[:downloads][:stable] = "/stable_downloads"
      @links[:downloads][:nightly] = "https://ci.easyrpg.org target='_blank'"
      @links[:downloads][:source] = "https://github.com/EasyRPG/ target='_blank'"
      @links[:community] = {}
      @links[:community][:board] = "https://community.easyrpg.org"
      @links[:community][:blog] = "https://blog.easyrpg.org"
      @links[:community][:twitter] = "https://twitter.com/easyrpg/ target='_blank'"
      @links[:community][:instagram] = "https://www.instagram.com/easyrpg_org/ target='_blank'"
      @links[:community][:facebook] = "https://www.facebook.com/easyrpgofficial/ target='_blank'"
      @links[:community][:wiki] = "https://wiki.easyrpg.org target='_blank'"
      @links[:contact] = {}
      @links[:contact][:discord] = "https://discord.com/invite/NrC8yGCgqj target='_blank'"
      @links[:contact][:matrix] = "https://app.element.io/#/room/%23easyrpg:matrix.easyrpg.org target='_blank'"
      @links[:contact][:irc] = "/contact/irc/"
      @links[:contact][:email] = "/email"
      @links[:date] = "#{Date.today.year}"
    end
  
    def links
      @links
    end
  end

  $links = Links.new.links