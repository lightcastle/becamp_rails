# unicorn_rails -c /data/github/current/config/unicorn.rb -E production -D

rails_env = ENV['RAILS_ENV'] || 'production'

worker_processes 4
preload_app true

# Restart any workers that haven't responded in 30 seconds
timeout 30

app_root = '/app/becamp'
# Listen on a Unix data socket
listen "#{app_root}/current/tmp/sockets/unicorn.sock", :backlog => 2048
working_directory "#{app_root}/current"
stdout_path "#{app_root}/shared/log/unicorn.stdout.log"
stderr_path "#{app_root}/shared/log/unicorn.stderr.log"
pid "#{app_root}/shared/tmp/pids/unicorn.pid"

##
# REE
# http://www.rubyenterpriseedition.com/faq.html#adapt_apps_for_cow
if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end

before_exec do |_|
  ENV["BUNDLE_GEMFILE"] = File.join(app_root, 'current', 'Gemfile')
end

before_fork do |server, worker|
  ##
  # When sent a USR2, Unicorn will suffix its pidfile with .oldbin and
  # immediately start loading up a new version of itself (loaded with a new
  # version of our app). When this new Unicorn is completely loaded
  # it will begin spawning workers. The first worker spawned will check to
  # see if an .oldbin pidfile exists. If so, this means we've just booted up
  # a new Unicorn and need to tell the old one that it can now die. To do so
  # we send it a QUIT.
  #
  # Using this method we get 0 downtime deploys.

  old_pid = Rails.root.join('tmp', 'pids', 'unicorn.pid.oldbin')
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  ##
  # Unicorn master loads the app then forks off workers - because of the way
  # Unix forking works, we need to make sure we aren't using any of the parent's
  # sockets, e.g. db connection
  ActiveRecord::Base.establish_connection
end