require 'json'

module CreateSearchIndex
  COMMON_WORDS = %w{ a able about across after all almost also am among an and
    any are as at be because been but by can cannot could dear did do does
    either else ever every for from get got had has have he her hers him his
    how however i if in into is it its just least let like likely may me might
    most must my neither no nor not of off often on only or other our own
    rather said say says she should since so some than that the their them then
    there these they this tis to too twas us wants was we were what when where
    which while who whom why will with would yet you your' }
  EASYRPG_SPECIALS = %w{ div class info markdown }

  def make_search_index
    a = Array.new

    @items.each do |item|
      next if item.binary?
      next if item[:is_hidden]
      next unless ["html", "md"].include? item.identifier.ext

      words = item.raw_content.downcase.split(/\W+/)
      keywords = words.uniq - COMMON_WORDS - EASYRPG_SPECIALS
      a << {
        id: item.path,
        title: item[:title],
        tags: item[:tags] ? item[:tags].join(" ") : "",
        body: keywords.join(" ")
      }
    end

    # add some static items for content not managed by nanoc
    a << {
      id: "/player/manual/",
      title: "Player manual page",
      tags: "player manual linux",
      body: "command line options environment variables"
    }
    a << {
      id: "/player/doxydoc/",
      title: "Player source documentation",
      tags: "player doxygen source",
      body: "doxygen lcf struct scenes engine"
    }
    a << {
      id: "https://blog.easyrpg.org",
      title: "Blog",
      tags: "player editor",
      body: ""
    }
    a << {
      id: "https://wiki.easyrpg.org",
      title: "Wiki",
      tags: "player wiki dokuwiki documentation",
      body: "users"
    }
    a << {
      id: "https://community.easyrpg.org",
      title: "Community",
      tags: "forums discourse communication",
      body: "users"
    }

    JSON.pretty_generate(a)
  end
end
