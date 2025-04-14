require 'json'

class GithubLibLcfDataSource < Nanoc::DataSource
  identifier :github_liblcf

  def items
    JSON.parse(open(".cache/liblcf_issues.json").read()).map do |x|
      new_item(x["title"], x, "/liblcf/issues/#{x["number"]}")
    end
  end
end
