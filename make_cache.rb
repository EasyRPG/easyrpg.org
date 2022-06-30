#!/usr/bin/env ruby

require "json"
require "open-uri"

def fetch(repo)
  i = 1
  res = []

  loop do
    j = JSON.parse(URI.open("https://api.github.com/repos/easyrpg/#{repo}/issues?per_page=100&page=#{i}&filter=all&state=all&sort=created").read())
    return res if j.length == 0
    j.each { |item|
      res.push({
        title: item["title"],
        number: item["number"],
        is_pr: item.key?("pull_request")
      })
    }
    i += 1
  end
end

liblcf = fetch("liblcf")
player = fetch("player")

File.open(".cache/liblcf_issues.json", "w") do |f|
  f.write(JSON.pretty_generate(liblcf))
end

File.open(".cache/player_issues.json", "w") do |f|
  f.write(JSON.pretty_generate(player))
end
