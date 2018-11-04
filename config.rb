# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

page "/tutorials/*", :layout => "tutorial"

require 'redcarpet'
set :markdown_engine, :redcarpet
set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true, :with_toc_data => true
#set :markdown, :fenced_code_blocks => true, :smartypants => true

activate :livereload

set :css_dir, 'assets/css'
set :js_dir, 'assets/javascript'
set :images_dir, 'assets/images'
set :layouts_dir, 'layouts'
set :partials_dir, 'partials'

set :relative_links, true
activate :relative_assets
set :strip_index_file, true

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

require "lib/helpers"
helpers Helpers

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end

configure :development do
  set :debug_assets, true
  config[:host] = "http://localhost:4567"
end

configure :build do
  config[:host] = "https://www.stlt.de"
end