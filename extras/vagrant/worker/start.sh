cd /vagrant
bundle exec sidekiq --logfile=log/sidekiq-$(hostname).log --pidfile=tmp/sidekiq-$(hostname).pid --config /vagrant/config/sidekiq.yml --daemon
