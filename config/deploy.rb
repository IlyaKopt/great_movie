# config valid for current version and patch releases of Capistrano
lock '3.10.2'

set :application, 'great_movie'
set :repo_url, 'git@github.com:IlyaKopt/great_movie.git'

set :rvm_type, :system
set :rvm_ruby_version, -> { "2.5.3@#{fetch(:application)} --create" }
set :assets_roles, [:app, :web]

set :deploy_to, "/home/deploy/var/www/#{fetch(:application)}"
set :passenger_in_gemfile, true

# Default value for :linked_files is []
append :linked_files, 'config/database.yml', 'config/secrets.yml', '.ruby-gemset', '.ruby-version'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'vendor/bundle', 'public/assets', 'public/tmp'

# Default value for keep_releases is 5
set :keep_releases, 5

set :passenger_restart_with_touch, true

namespace :deploy do
  task :any_task do
    on 'deploy@138.68.84.233' do
      within "#{fetch(:deploy_to)}/current" do
        execute :bundle, :exec, 'rake db:seed RAILS_ENV=production'
      end
    end
  end
end
