set :application, "multienv_sample"

default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :repository, "git@github.com:sgtakeru/multienv_sample.git"  # Your clone URL
set :scm, "git"
set :user, "shigemori"  # The server's user for deploys
set :scm_passphrase, "p@ssw0rd"  # The deploy user's password

set :deploy_to, "/tmp/#{application}"
set :server_name, "localhost"

role :web, server_name                          # Your HTTP server, Apache/etc
role :app, server_name                          # This may be the same as your `Web` server
role :db,  server_name, :primary => true # This is where Rails migrations will run


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
