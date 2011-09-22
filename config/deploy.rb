require 'capistrano/ext/multistage'
require 'config/boot'
require "bundler/capistrano"

set :stages, %w(staging production)
set :default_stage, "production"

default_run_options[:pty] = true

set :application, 'ushelf'

set :scm, :git
set :git_shallow_clone, 1
set :scm_user, 'admin'
set :repository, "git://github.com/Vizzuality/ushelf.git"
ssh_options[:forward_agent] = true
set :keep_releases, 5

set :linode_staging, 'medialab.grida.no'
set :linode_production, 'medialab.grida.no'

after "deploy:update_code", :symlinks, :asset_packages
after "deploy", "deploy:cleanup"

desc "Restart Application"
deploy.task :restart, :roles => [:app] do
  run "touch #{current_path}/tmp/restart.txt"
end

desc "Migraciones"
task :run_migrations, :roles => [:app] do
  run <<-CMD
    export RAILS_ENV=production &&
    cd #{release_path} &&
    rake db:migrate
  CMD
end

task :symlinks, :roles => [:app] do
  run <<-CMD
    ln -s #{shared_path}/dragonfly #{release_path}/tmp/
  CMD
end

desc 'Create asset packages'
task :asset_packages, :roles => [:app] do
 run <<-CMD
   export RAILS_ENV=production &&
   cd #{release_path} &&
   rake asset:packager:build_all
 CMD
end