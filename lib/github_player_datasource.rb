require 'json'

class GithubPlayerDataSource < Nanoc::DataSource
  identifier :github_player

  def items
    JSON.parse(open(".cache/player_issues.json").read()).map do |x|
      new_item(x["title"], x, "/player/issues/#{x["number"]}")
    end
  end
end
