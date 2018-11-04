module Helpers

	def menu_link name, url, item_class=""
	  path = current_page.url
	  current = path.include? url

	  class_active = current ? 'is-active' : ''

	  #link_to name, url, class: item_class+" "+class_active 
	  "<a class=\"#{item_class+" "+class_active }\" href=\"#{url}\">#{name}</a>"
	end

end