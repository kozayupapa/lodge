Chef::Log.info("XXX Running deploy/before_migrate.rb")
env = node[:deploy][:lodge][:rails_env]
current_release = release_path


execute "cp env" do
  cwd current_release
  command "cp /srv/www/lodge/current/.env ./"
  environment "RAILS_ENV" => env
end

execute "rake assets:precompile" do
  cwd current_release
  command "bundle exec rake assets:precompile"
  environment "RAILS_ENV" => env

end

