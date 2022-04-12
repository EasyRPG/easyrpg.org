
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
  # link to homepage
  elsif p =~ /\/about/
    target = "/"
    upper = "Homepage"
  # link from each section to about page
  elsif p =~ /\/[^\/]*\//
    target = "/about/"
    upper = "About EasyRPG"
  end

  attributes[:class] = "upper"
  attributes[:title] = "Back to #{upper} page"

  link_to(text + " " + upper + " " + text, target, attributes)
end

def navigation_for(item)
  # global: e.g. player
  section = item.identifier.components[0]

  # strip ext if section front page
  if section == item.identifier.to_s[1..] then
    section = item.identifier.without_ext[1..]
  end

  # make path
  if section == "about" then
    # special case: is the global section
    section = "/"
    part = 0
  else
    section = "/" + section + "/"
    part = 1
  end

  # get all sections members
  h = Hash.new
  @items.find_all(section + '*').each do |it|
    next if not it.identifier.to_s.end_with?(".html", ".md")
    next if it[:is_hidden] # 404
    next if part == 0 and it.identifier.to_s == "/index.html" # homepage

    subsection = it.identifier.components[part].split(".")[0]

    h[subsection] = { :text => it[:menu_name] ? it[:menu_name] : subsection.capitalize,
                  :link => section + subsection + "/",
                  :weight => it[:menu_weight] ? it[:menu_weight] : 0 }
  end

  # sort by weight, default = 0 puts at end
  return h.sort_by { |k, v| v[:weight] }.reverse
end
