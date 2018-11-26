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

	def img_frame(image, caption)
		concat(partial('layouts/partials/img_frame', locals:{image: image, caption: caption}))
	end

	def note(heading,type = 'info', &block)
		if block_given?
      content = capture_html(&block).to_s
    else
    	content = ''
    end
    concat(partial('layouts/partials/note', locals: {heading: heading, message: content, type: type}))
	end

	def spoiler(heading, &block)
		if block_given?
      content = capture_html(&block).to_s
    else
    	content = ''
    end
		concat(partial('layouts/partials/spoiler', locals: {heading: heading, concent: content}))
	end

	def prev_next_links
		sorted_siblings = current_page.parent.children.each.sort_by { |a| a.data.title }
		sorted_siblings.insert(0, current_page.parent)
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