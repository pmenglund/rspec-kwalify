guard :bundler, :notify => false do
  watch("Gemfile")
end

guard :rspec, :version => 2, :cli => "--color --format nested --fail-fast" do
  watch(%r{spec/assets/.+\.yml})        { "spec" }
  watch("spec/spec_helper.rb")          { "spec" }

  watch(%r{^spec/.+_spec\.rb})
  watch(%r{^lib/(.+)\.rb})              { |m| "spec/#{m[1]}_spec.rb" }
end

guard :yard do
  watch("README.md")
  watch("lib")
end
