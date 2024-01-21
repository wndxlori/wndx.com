set :application, "wndx.com"
set :repository,  "_site"

set :scm, :none
set :deploy_via, :copy
set :copy_compression, :gzip
set :use_sudo, false

# the name of the user that should be used for deployments on your VPS
set :user, "root"

# the path to deploy to on your VPS
# the "current" dir will be under this directory, and will be your document root
set :deploy_to, "/var/www/wndx.com"

# the ip address of your VPS
role :web, "138.197.128.172"

before "deploy:update", "deploy:update_jekyll"

# your images and CSS may not appear to work after the symlink process
# this rule and subsequent code fixes this issue
after "deploy:create_symlink", "deploy:fix_permissions"

# Adds Apache virtual host to sites_available
after "deploy:setup", "deploy:add_vhost"

namespace :deploy do
  [:start, :stop, :restart, :finalize_update].each do |t|
    desc "#{t} task is a no-op with jekyll"
    task t, :roles => :app do ; end
  end

  desc "Setup apache virtual host"
  task :add_vhost, :roles => :web do
    apache_vhost = <<-VHOST
<VirtualHost *:80>
  ServerAdmin wndx@me.com
  ServerName wndx.com
  ServerAlias www.wndx.com
  DocumentRoot /var/www/wndx.com/current
  <Directory "/var/www/wndx.com/current/clients/kudos">
    AuthType Basic
    AuthName "Authentication Required"
    AuthUserFile "/etc/apache2/.htpasswd"
    Require user kudos
    Order allow,deny
    Allow from all
  </Directory>
  # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
  # error, crit, alert, emerg.
  # It is also possible  configure the loglevel for particular
  # modules, e.g.
  #LogLevel info ssl:warn

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined

  RewriteEngine on
  RewriteCond %{SERVER_NAME} =wndx.com [OR]
  RewriteCond %{SERVER_NAME} =www.wndx.com
  RewriteRule ^ https://%{SERVER_NAME}%{REQUEST_URI} [END,QSA,R=permanent]
</VirtualHost>
VHOST
    put apache_vhost, "/etc/apache2/sites-available/wndx.com.conf"
  end

  desc "Run jekyll to update site before uploading"
  task :update_jekyll do
    # clear existing _site
    # build site using jekyll
    # remove Capistrano stuff from build
    %x(rm -rf _site/* && JEKYLL_ENV=production jekyll build)
  end

  desc "Fix permissions"
  task :fix_permissions do
    # chmod files on the server
    run "chmod 755 -R #{current_path}"
#    run "chmod 644 -R #{current_path}/.htaccess"
  end
end