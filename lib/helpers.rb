
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
