sudo rm /etc/redis/redis.conf
sudo ln -s /vagrant/config/redis.conf /etc/redis/redis.conf
sudo service redis-server restart

cd /vagrant
bundle exec sidekiq --logfile=log/sidekiq-$(hostname).log --pidfile=tmp/sidekiq-$(hostname).pid --config /vagrant/config/sidekiq.yml --daemon
