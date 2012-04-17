ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../Gemfile", __FILE__)

require "rubygems"
require "bundler"
Bundler.setup(:default, :test)

require "rspec"
require "rspec-kwalify"

def asset(file)
  File.expand_path(File.join(File.dirname(__FILE__), "assets", file))
end

def load_yaml(file)
  Kwalify::Yaml.load_file(asset(file))
end