# Configure path for assets
config[:css_dir] = 'assets/stylesheets'
config[:js_dir] = 'assets/javascripts'
config[:images_dir] = 'assets/images'
config[:partials_dir] = 'partials'

# Configure path for bower assets
after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
end

# Pretty urls
activate :directory_indexes

# Minimize css/js and fix assets for Build
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
end
