class GitHubIssuesFilter < Nanoc::Filter
  identifier :github_issues
  type :text

  def run(content, params={})
    liblcf_issues = @items.find_all('/github/liblcf/issues/*')
    player_issues = @items.find_all('/github/player/issues/*')

    content.scan(/player#\d+/).each { |x|
      n = (x.match /\d+/)[0].to_i
      issue = player_issues[n]
      type = issue[:is_pr] ? "pulls" : "issues"
      url = "https://github.com/EasyRPG/Player/#{type}/#{n}"
      content = content.gsub(x, "[\##{n}](#{url} \"Player: #{issue[:title]}\")")
    }

    content.scan(/liblcf#\d+/).each { |x|
      n = (x.match /\d+/)[0].to_i
      issue = liblcf_issues[n]
      type = issue[:is_pr] ? "pulls" : "issues"
      url = "https://github.com/EasyRPG/liblcf/#{type}/#{n}"
      content = content.gsub(x, "[\##{n}](#{url} \"liblcf: #{issue[:title]}\")")
    }

    content
  end
end
