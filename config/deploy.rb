require 'rubygems'
#require 'capcake'

set :application, "jawoserver"
set :scm, :git
set :repository,  "https://github.com/oskarmaeder/massivecake.git"
# set :scm_username, "username"					# Your username to log into your repository
# set :scm_passphrase, Capistrano::CLI.password_prompt("Type your ssh passphrase for user #{scm_username}: ")


server "localhost", :web

ssh_options[:port] = 2222
ssh_options[:keys] = "~/.vagrant.d/insecure_private_key"

set :user, "vagrant"
set :group, "vagrant"
set :deploy_to, "/var/jawoserver"
set :use_sudo, false

set :deploy_via, :copy
set :copy_strategy, :export

# set :deploy_via, :remote_cache
# set(:group_writable, false)


###
# Production
###

task :production do
  set :deploy_to, "/var/jawoserver"		# Your production root path
  set :user, "vagrant"						# Your production user
  set :group, "vagrant"					# Your production group
  server "localhost", :web					# Your production server url
end

task :chmod_tmp do
	run "chmod 777 #{latest_release}/public/app/tmp"
	run "chmod 777 #{latest_release}/public/app/tmp/cache"
	run "chmod 777 #{latest_release}/public/app/tmp/logs"
	run "chmod 777 #{latest_release}/public/app/tmp/sessions"
	run "chmod 777 #{latest_release}/public/app/tmp/tests"
	run "chmod 777 #{latest_release}/public/app/tmp/cache/models"
	run "chmod 777 #{latest_release}/public/app/tmp/cache/persistent"
	run "chmod 777 #{latest_release}/public/app/tmp/cache/views"
	#run "cp ~/database.php #{latest_release}/public/app/Config/database.php"
	run "cp /var/jawoserver/current/phpinfo.php /var/jawoserver/current/public/app/webroot"
end



# ssh_options[:forward_agent] = true

#set :cake_branch, " "

#capcake