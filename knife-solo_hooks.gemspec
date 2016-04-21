Gem::Specification.new do |s|
  s.name = "knife-solo_hooks"
  s.version = "0.0.1"
  s.summary = "Before and after hooks for knife solo commands"
  s.author = "Mark Woods"
  s.homepage = "https://github.com/thickpaddy/knife-solo_hooks"
  s.files = `git ls-files`.split("\n")

  s.add_dependency "hooks"
  s.add_dependency "knife-solo"
end
