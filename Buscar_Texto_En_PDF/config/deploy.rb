require 'bundler/capistrano'

set :application, "buscarTexto.com"
set :repository,  "git@github.com:joelmatiassilva/Buscar_Texto_En_PDF.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, 'deploy'
set :use_sudo, false
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache

role :web, "buscarTexto.com"                          # Your HTTP server, Apache/etc
role :app, "buscarTexto.com"                          # This may be the same as your `Web` server
role :db,  "buscarTexto.com", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
