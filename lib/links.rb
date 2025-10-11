
def jenkins_link(job, file)
	return "https://ci.easyrpg.org/job/#{job}/lastSuccessfulBuild/artifact/#{file}"
end

def media_img(file, alt = "[image]")
	return "[![#{alt}](/images/thumbs/#{file})](/images/#{file} '#{alt}')"
end

def media_vid(file, title = "[video]")
	thumb = Pathname.new(file).sub_ext(".png").to_s
	return "[![[video]](/videos/thumbs/#{thumb})](/videos/#{file} '#{title}')"
end
