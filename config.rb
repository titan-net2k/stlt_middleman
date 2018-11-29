# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :directory_indexes

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

page "/tutorials/*", :layout => "tutorial"
#page "/tutorials/index.html", :layout => "layout"

#require 'redcarpet'
activate :syntax
set :markdown_engine, :kramdown
set :markdown, 
  input: "GFM", 
  syntax_highlighter: "coderay"

#set :markdown_engine, :redcarpet
#set :markdown, tables: true, autolink: true, with_toc_data: true, no_intra_emphasis: true, fenced_code_blocks: true, lax_spacing: true
#set :markdown, :fenced_code_blocks => true, :smartypants => true, :gh_blockcode => true, :fenced_code_blocks => true,

activate :livereload

set :css_dir, 'assets/css'
set :js_dir, 'assets/javascript'
set :images_dir, 'assets/images'
set :layouts_dir, 'layouts'

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

configure :development do
  set :debug_assets, true
  config[:host] = "http://localhost:4567"
end

configure :build do
  config[:host] = "https://www.stl-tec.de"

  #activate :minify_css
  #activate :minify_javascript
end

activate :deploy do |deploy|
  deploy.deploy_method   = :sftp
  deploy.host            = ENV['middleman_host']
  deploy.path            = '/'
  deploy.port            = 21
  deploy.user            = ENV['middleman_user']
  deploy.password        = ENV['middleman_password']
end