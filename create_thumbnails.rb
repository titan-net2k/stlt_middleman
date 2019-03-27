#!/usr/bin/ruby

require 'rmagick'

images = Dir["source/tutorials/**/*.png"] + Dir["source/articles/**/*.png"]

images.each do | image |

	img = Magick::Image.read(image).first
	#img.change_geometry("400x300")
	#img.resize_to_fit(400).write(File.dirname(image)+"/thumb."+File.basename(image))
	img.resize_to_fit(400).write(image.rpartition('.')[0]+".thumb."+image.rpartition('.')[2])
end