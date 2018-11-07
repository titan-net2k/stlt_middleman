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

	def prev_next_links
		sorted_siblings = current_page.parent.children.each.sort_by { |a| a.data.title }
    	sorted_siblings.each_with_index do | sibling, index |
	      	if sibling.url == current_page.url
	        	s = ''
	        	prev_page = sorted_siblings[index-1]
	        	next_page = sorted_siblings[index+1]
	        	unless index == 0
	        		s += link_to('Pevious: ' +prev_page.data.title, prev_page.path) + '    '
	        		s += '<br>'
	        	end
	        	unless index == (sorted_siblings.size-1)
	        		s += link_to('Next: ' + next_page.data.title, next_page.path) 
	        	end
	        	return s
	      	end
	    end
	end

end