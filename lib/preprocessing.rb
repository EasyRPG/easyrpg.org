
# called by preprocess block
def write_ad_files
  text = "# We hate ads, so nothing to see here... Move along!"

  @items.create(text, {}, '/ads.txt')
  @items.create(text, {}, '/app-ads.txt')
end

def check_webpack_files
  raise "JS files not found, run yarn." unless @items['/static/js/*.js']
  raise "CSS files not found, run yarn." unless @items['/static/css/*.css']
end
