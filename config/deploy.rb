set :application, "multienv_sample"

default_run_options[:pty] = true  # Must be set for the password prompt from git to work
set :repository, "git@github.com:sgtakeru/multienv_sample.git"  # Your clone URL
set :scm, "git"
set :user, "ec2-user"  # The server's user for deploys
set :scm_passphrase, "p@ssw0rd"  # The deploy user's password
set :deploy_via, :copy
set :copy_cache, false
set :copy_strategy, :export
set :copy_compression, :zip
set :use_sudo, false

set :rails_env, "development"
case rails_env
when "hoge"
  set :deploy_to, "/var/___sample/hoge/#{application}"

when "development"
  set :deploy_to, "/var/___sample/dev/#{application}"

end
set :server_name, "ec2-175-41-220-139.ap-northeast-1.compute.amazonaws.com"


ssh_options[:keys] = %w(/home/shigemori/.ssh/haw-docomo-seo.pem)

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
