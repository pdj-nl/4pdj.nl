###
# Blog settings
###

# Time.zone = "UTC"
Time.zone = "CET"

# Personal blog
activate :blog do |blog|
  blog.name = "personal"
  blog.prefix = "personal"
  blog.permalink = ":year/:month/:day/:title.html"
  blog.sources = ":year-:month-:day-:title.html"
  blog.layout = "article"
  blog.paginate = true
  blog.page_link = "p:num"
  blog.per_page = 10
  blog.default_extension = ".markdown.erb"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
end

# Technology blog
activate :blog do |blog|
  blog.name = "technology"
  blog.prefix = "technology"
  blog.permalink = ":year/:month/:day/:title.html"
  blog.sources = ":year-:month-:day-:title.html"
  blog.layout = "article"
  blog.paginate = true
  blog.page_link = "p:num"
  blog.per_page = 10
  blog.default_extension = ".markdown.erb"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
end

# Gaming blog
activate :blog do |blog|
  blog.name = "gaming"
  blog.prefix = "gaming"
  blog.permalink = ":year/:month/:day/:title.html"
  blog.sources = ":year-:month-:day-:title.html"
  blog.layout = "article"
  blog.paginate = true
  blog.page_link = "p:num"
  blog.per_page = 10
  blog.default_extension = ".markdown.erb"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
end

# Baka na inu blog
activate :blog do |blog|
  blog.name = "baka na inu"
  blog.prefix = "baka_na_inu"
  blog.permalink = ":year/:month/:day/:title.html"
  blog.sources = ":year-:month-:day-:title.html"
  blog.layout = "article"
  blog.paginate = true
  blog.page_link = "p:num"
  blog.per_page = 10
  blog.default_extension = ".markdown.erb"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
end

# RSS Feed
page "/feed.xml", :layout => false

# Enable LiveReload
activate :livereload

# Enable Pretty URL's
activate :directory_indexes

# Enable markdown
set :markdown_engine, :kramdown
set :markdown, :layout_engine => :erb,
               :tables => true,
               :autolink => true,
               :smartypants => true

# Enable GZIP compression
activate :gzip

# Syntax
activate :syntax

# Sprockets
activate :sprockets

# Breadcrumbs
require "lib/breadcrumbs"
helpers Breadcrumbs

# AllArticles
require "lib/multiblog"
helpers MultiBlog

# Sitemap.xml
require 'builder'
page "/sitemap.xml", :layout => false
page "/sitemap.html", :layout => false, :directory_index => false

# 404
page "/404.html", :directory_index => false
proxy "/404blank.html", "/404.html", :directory_index => false, :layout => :blank

# Bing
page "/BingSiteAuth.xml", :layout => false

proxy "baka_na_inu.html", "/index_baka.html", :ignore => true

ready do
  blog_instances.each do |key,blog|
    if (!key.to_s.include? 'baka') then
      proxy "#{blog.options.prefix.to_s}.html", "/index.html", :locals => {:category => key}
    end
  end
end

###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'assets/css'

set :js_dir, 'assets/js'

set :images_dir, 'images'

ignore 'assets/img/sigil-white.png'

ignore 'assets/js/license.js'
ignore 'assets/js/bootstrap.js'
ignore 'assets/js/jquery.js'
ignore 'assets/js/lightbox.js'
ignore 'assets/js/stick_navbar.js'
ignore 'assets/js/search.coffee'

ignore 'assets/css/lightbox.css'
ignore 'assets/css/inconsolata.css'

Dir["source/assets/css/*.less"].each do |f|
  next if File.basename(f) == 'style.less'
  ignore f.gsub('source/', '')
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Minify html
  activate :minify_html

  # Favicon generator
  #activate :favicon_maker,
  #  :favicon_maker_input_dir => "source/assets/img/",
  #  :favicon_maker_base_image => "sigil-white.png"

  # Enable cache buster
  #activate :cache_buster

  # Use relative URLs
  #activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
