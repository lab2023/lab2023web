root = "/home/deployer/apps/lab2023/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.lab2023.sock", :backlog => 64
worker_processes 2
timeout 30