
# allow partial layouts (menu/submenu)
include Nanoc::Helpers::Rendering
# generate links to specific items
include Nanoc::Helpers::LinkTo

def link_to_upper_page(text, attributes = {})
  p = @item_rep.path

  # link from each subsection to section
  if p =~ /(\/[^\/]*\/)[^\/]*\//
    target = $1

    if target == "/contribute/"
      upper = "Introduction"
    else
      upper = "Overview"
    end
  # link from each section to about page
  elsif p =~ /\/[^\/]*\//
    target = "/about/"
    upper = "About"
  end

  # set corresponding title, if not set
  if not attributes.key?(:title) then
    attributes[:title] = "Back to #{upper} page"
  end

  link_to(text, target, attributes)
end
