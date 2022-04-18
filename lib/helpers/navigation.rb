
# allow partial layouts (menu/submenu)
include Nanoc::Helpers::Rendering
# generate links to specific items
include Nanoc::Helpers::LinkTo

def link_to_upper_page(attributes = {})
  p = @item_rep.path

  # link to homepage
  if p =~ /\/about/
    target = "/"
    upper = "Homepage"
  # link from each section to about page
  elsif p =~ /\/[^\/]*\//
    target = "/about/"
    upper = "About EasyRPG"
  end

  attributes[:class] = "upper"
  attributes[:title] = "Back to #{upper} page"

  link_to("↻ " + upper, target, attributes)
end

def navigation_for(item)
  # global: e.g. player
  section = item.identifier.components[0]

  # make path
  if section == "about" then
    # special case: is the global section
    section = "/"
    search = "*/index.*"
    part = 0
  else
    section = "/" + section + "/"
    search = "*"
    part = 1
  end

  # get all sections members
  h = Hash.new
  @items.find_all(section + search).each do |it|
    next if not it.identifier.to_s.end_with?(".html", ".md")
    next if it[:is_hidden] # e.g. 404
    next if it[:no_menu] # e.g. contact
    next if it.identifier.to_s == "/index.html" # homepage

    # defaults
    subsection = it.identifier.components[part].split(".")[0]
    menu_name = it[:menu_name] ? it[:menu_name] : subsection.capitalize
    link = section + subsection + "/"
    menu_weight = it[:menu_weight] ? it[:menu_weight] : 0

    # special case subsection index
    if subsection == "index"
      case section
      when "/search/"
        menu_name = "🔍 Site search"
      when "/contribute/"
        menu_name = "Introduction"
      else
        menu_name = "Overview"
      end
      link = section
      menu_weight = 100
    end

    h[subsection] = { :text => menu_name, :link => link, :weight => menu_weight }
  end

  # sort by weight, default = 0 puts at end
  return h.sort_by { |k, v| v[:weight] }.reverse
end
