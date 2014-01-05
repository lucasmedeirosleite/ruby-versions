# Ruby Cookbook for Chef

This is a cookbook for chelf to install ruby on the host machine

The ruby versions supported are:

* 1.9.3
* 2.0.0
* 2.1.0

##Installation

* If you are using vagrant with chef solo just clone this project to your cookbooks
folder and add "ruby-versions" to your run list

* If you are using berkshelf to manage your chef cookbooks, put this on yout Berksfile:

```ruby

cookbook "ruby-versions", git: "git@github.com:lucasmedeirosleite/ruby-versions.git", tag: "0.0.1"

```

## Changing ruby version

Just add this to your node json:

```json

{
	"ruby": {
		"version": "2.0"
	}
}


```

Versions can be:

* 1.9
* 2.0
* 2.1

##Thanks to:

[fnando](https://github.com/fnando) who provided apt sources ;)




