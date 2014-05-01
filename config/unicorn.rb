worker_processes 2

listen '/tmp/unicorn.sock'
pid "/home/ec2-user/deploy/shared/tmp/pids/unicorn.pid"

stderr_path File.expand_path('unicorn.log', File.dirname(__FILE__) + '/../log')
stdout_path File.expand_path('unicorn.log', File.dirname(__FILE__) + '/../log')
preload_app true

before_fork do |server, worker|
  old_pid = "#{server.config[:pid]}.oldbin"
  p "@" * 30 + old_pid
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end
