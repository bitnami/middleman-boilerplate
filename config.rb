# Configure the assets folders
set :build_dir, 'build'
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

# Disable warnings from HAML
Haml::TempleEngine.disable_option_validator!

# Use haml in this project
set :haml, { format: :html5 }

# Use the current directory to be able to use HEx helpers
set :sass_assets_paths, ['.']

# Remove .html in the URL
activate :directory_indexes

# enable livereload on development
configure :development do
  host = ENV['VIRTUAL_HOST'].present? ? ENV['VIRTUAL_HOST'] : '127.0.0.1'
  activate :livereload, js_host: host, js_port: 35729
end

# Configure build environment
configure :build do
  # If you set the MIDDLEMAN_HTTP_PREFIX environment variable on build,
  # all the assets will include this prefix in the URL. This is very useful
  # to deploy the site to GitHub Pages.
  set :http_prefix, ENV['MIDDLEMAN_HTTP_PREFIX'] if ENV['MIDDLEMAN_HTTP_PREFIX'].present?
end
