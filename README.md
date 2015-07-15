# Test #1: Sidekiq on a separate server

Repository linked to my blog article: http://blog.nicolas-brousse.fr/articles/2015-07-15-test-1--sidekiq-on-separate-servers/


## Requirements

To use this application you only need:

* [Vagrant](http://www.vagrantup.com/downloads.html)
* [Virtualbox](https://www.virtualbox.org/wiki/Downloads)


## Installation

You could configure the instances by updating the vars who are on the top of `Vagrantfile`.

```ruby
...
$worker_num_instances = 2
$worker_memory = 768
$web_memory = 768
...
```

Then just do this two lines:

```sh
$ cd /path/to/the/project
$ vagrant up
```

Wait some minutes that vagrant configure the VMs (it could take a while).
Then you can access the web application with [`10.10.150.10:3000`](http://10.10.150.10:3000/).

To access the Sidekiq dashboard go to [`10.10.150.10:3000/sidekiq`](http://10.10.150.10:3000/sidekiq).


## Resources

* http://railscasts.com/episodes/366-sidekiq
* http://stackoverflow.com/questions/42566/getting-the-hostname-or-ip-in-ruby-on-rails
