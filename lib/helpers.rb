module Helpers

	def menu_link name, url, item_class=""
	  path = current_page.url
	  current = path.include? url

	  class_active = current ? 'is-active' : ''

	  #link_to name, url, class: item_class+" "+class_active 
	  "<a class=\"#{item_class+" "+class_active }\" href=\"#{url}\">#{name}</a>"
	end

	def img(relative_path, alt=nil)
	  url = current_page.url
	  alt ? alt_attr = "alt='#{alt}' " : alt_attr = ''

	  "<img #{alt_attr} src='#{url}/#{relative_path}'>"  # return
	end

end