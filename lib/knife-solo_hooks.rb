require 'hooks'

module Chef::Knife::SoloHooks
  def self.prepended(base)
    base.class_eval do
      include Hooks
      define_hooks :before, :after
    end
  end

  def run
    run_hook :before
    super
    run_hook :after
  end
end

class Chef::Knife::SoloCook
  prepend SoloHooks
end
