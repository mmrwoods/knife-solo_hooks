# Knife Solo Hooks

A simple gem that adds before and after hooks to selected knife solo commands.

Currently hooks are only added to the cook command, because that's all I need.

I wrote the gem so I could tag releases of my chef repos, and keep track of what
has been released where directly in git, but it may have other uses, who knows?

## Installation

Assuming you are using bundler, just add to Gemfile:

    gem 'knife-solo_hooks', github: 'thickpaddy/knife-solo_hooks'

If you are not using bundler, you know what you're doing, install the gem :-)

## Usage

This gem uses the lovely [hooks gem](https://github.com/apotonick/hooks) to
define before and after hook methods on the `Chef::Knife::SoloCook` class.

Use these class methods to create callbacks that get triggered before and after
the `knife solo cook` command is run (i.e. the #run method is called).

For example, as quick hack, in `knife.rb` you could add:

```ruby
require 'knife-solo_hooks'

...

Chef::Knife::SoloCook.before do
  ui.msg "Let's get cooking!"
end

Chef::Knife::SoloCook.after do
  ui.msg "Finished cooking"
end
```

Note: you probably don't want to add callbacks like this directly to `knife.rb`
as it gets loaded in circumstances where `Chef::Knife::SoloCook` won't exist,
and it can get loaded multiple times, creating multiple callbacks. Much better
to write a separate plugin that does what you need, which is loaded once.
