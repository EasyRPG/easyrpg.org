
# generate a sitemap for search engines (http://www.sitemaps.org/)
use_helper Nanoc::Helpers::XMLSitemap

# Return all "content" items (pages that are not hidden) for inclusion
def content_items
  @items.select do |item|
    !item[:is_hidden] && (item[:extension] == '.html' || item.path.to_s.end_with?('/'))
  end
end
