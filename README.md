# Test #1: Sidekiq on a separate server

Repository link to my article: http://blog.nicolas-brousse.fr/articles/2015-07-15-test-1--sidekiq-on-separate-servers/


## Requirements

To use try this application you only need:

* [Vagrant](http://www.vagrantup.com/downloads.html)
* [Virtualbox](https://www.virtualbox.org/wiki/Downloads)


## Installation

You could configure the instances by updating the vars who are on the top of `Vagrantfile`.

Then just do this two lines:

```sh
$ cd /path/to/the/project
$ vagrant up
```

And you can access with [`10.10.150.10:3000`](http://10.10.150.10:3000/).

You also have access to the Sidekiq dashboard with [`10.10.150.10:3000/sidekiq`](http://10.10.150.10:3000/sidekiq).


## Resources

* http://railscasts.com/episodes/366-sidekiq
* http://stackoverflow.com/questions/42566/getting-the-hostname-or-ip-in-ruby-on-rails
