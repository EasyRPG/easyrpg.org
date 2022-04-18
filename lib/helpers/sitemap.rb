
# generate a sitemap for search engines (http://www.sitemaps.org/)
include Nanoc::Helpers::XMLSitemap

def hide_items_from_sitemap
  @items.each do |item|
    if %w{css scss xml js txt}.include?(item[:extension]) || item.identifier =~ /404/
      item[:is_hidden] = true if item[:is_hidden].nil?
    end
  end
end
