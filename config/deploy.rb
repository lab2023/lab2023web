require "bundler/capistrano"
#require 'thinking_sphinx/deploy/capistrano'
#require "whenever/capistrano"

server "127.0.0.1", :web, :app, :db, primary: true

set :port, 22
set :application, "lab2023"
set :user, "deployer"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :bundle_cmd, '/home/deployer/.rvm/gems/ruby-1.9.3-p194@global/bin/bundle'

set :scm, "git"
set :repository, "git@github.com:lab2023/#{application}web.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
#ssh_options[:keys] = ["~/.ssh/id_rsa"]
after "deploy", "deploy:cleanup" # keep only the last 5 releases

#after "deploy:symlink", "deploy:update_crontab"

namespace :deploy do

  task :precompile, :role => :app do
    run "cd #{release_path}/ && rake assets:precompile"
  end

  after "deploy:finalize_update", "deploy:precompile"

  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    #put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/db/production.sqlite3 #{current_path}/db/production.sqlite3"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"

  task :install_bundler, :roles => :app do
    run "type -P bundle &>/dev/null || { gem install bundler --no-rdoc --no-ri; }"
  end
  before "deploy:cold", "deploy:install_bundler"

  desc "Update the crontab file"
  #task :update_crontab, :roles => :db do
  #  run "cd #{release_path} && whenever --update-crontab #{application}"
  #end

end

set :default_environment, {
    'PATH'         => "/home/deployer/.rvm/gems/ruby-1.9.3-p194/bin:/home/deployer/.rvm/gems/ruby-1.9.3-p194@global/bin:/home/deployer/.rvm/rubies/ruby-1.9.3-p194/bin:/home/deployer/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$PATH",
    'RUBY_VERSION' => 'ruby-1.9.3-p194',
    'GEM_HOME'     => '/home/deployer/.rvm/gems/ruby-1.9.3-p194',
    'GEM_PATH'     => '/home/deployer/.rvm/gems/ruby-1.9.3-p194:/home/deployer/.rvm/gems/ruby-1.9.3-p194@global',
    'BUNDLE_PATH'  => '/home/deployer/.rvm/gems/ruby-1.9.3-p194/bin/bundle'
}

after "deploy", "deploy:cleanup"