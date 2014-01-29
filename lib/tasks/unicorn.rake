namespace :unicorn do

  desc "Start unicorn"
  task :start do
    config = rails_root + "config/unicorn.rb"
    sh "bundle exec unicorn --daemonize --config-file #{config}"
  end

  desc "Stop unicorn"
  task :stop do
    unicorn_signal :QUIT
  end

  desc "Restart unicorn with USR2"
  task :restart do
    unicorn_signal :USR2
  end

  desc "Increment number of worker processes"
  task :increment do
    unicorn_signal :TTIN
  end

  desc "Decrement number of worker processes"
  task :decrement do
    unicorn_signal :TTOU
  end

  desc "Unicorn pstree (depends on pstree command)"
  task :pstree do
    sh "pstree '#{unicorn_pid}'"
  end

  ##
  # Helpers

  def unicorn_signal signal
    Process.kill signal, unicorn_pid
  end

  def unicorn_pid
    begin
      File.read(rails_root + "tmp/pids/unicorn.pid").to_i
    rescue Errno::ENOENT
      raise "Unicorn doesn't seem to be running"
    end
  end

  def rails_root
    require "pathname"
    Pathname.new('/app/becamp/current')
  end

end