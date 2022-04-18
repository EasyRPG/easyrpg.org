
def jenkins_link(job, file)
	return "https://ci.easyrpg.org/job/" + job + "/lastSuccessfulBuild/artifact/" + file
end

def media_img(file, alt)
	return "[![" + alt + "](/images/thumbs/" + file + ")](/images/" + file + " '" + alt + "')"
end

def media_vid(file, title = nil)
	thumb = Pathname.new(file).sub_ext(".png").to_s
	if not title
		title = "[video]"
	end
	return "[![[video]](/videos/thumbs/" + thumb + ")](/videos/" + file + " '" + title + "')"
end

# deprecated

def link_to_jenkins_master(job)
  api_url = "https://ci.easyrpg.org/view/Player/job/#{job}/lastSuccessfulBuild/api/json?tree=actions[buildsByBranchName[buildNumber]]"
  build = "none"

  res = Net::HTTP.get(URI(api_url))
  if res
    j = JSON.parse(res)
    j["actions"].each{|action|
      if action.key? "buildsByBranchName"
        if action["buildsByBranchName"].key? "origin/master"
          build = action["buildsByBranchName"]["origin/master"]["buildNumber"]
        end
      end
    }
  end
  if ! build.is_a? Numeric
    # fallback
    build = "lastSuccessfulBuild"
  end

  return "https://ci.easyrpg.org/job/#{job}/#{build}/artifact"
end
