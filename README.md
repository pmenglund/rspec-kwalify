# RSpec-Kwalify [ ![travis-ci](https://secure.travis-ci.org/pmenglund/rspec-kwalify.png?branch=master "travis-ci") ](http://travis-ci.org/pmenglund/rspec-kwalify "Travis-CI")

[RSpec-Kwalify](https://github.com/pmenglund/rspec-kwalify) is a custom RSpec matcher to help you use [Kwalify](http://www.kuwata-lab.com/kwalify/ruby/users-guide.html), a [yaml](http://yaml.org/) validation [gem](http://rubygems.org/), in RSpec.

Instead of having tests like this:
<pre>
it "should have 2 validation errors" do
  errors = validator.validate(load_yaml("empty.yml"))
  errors.size.should == 2
  errors.each do |error|
    error.is_a?(Kwalify::ValidationError).should be_true
  end
end
</pre>

You can use the more readable
<pre>
it "should have 2 errors" do
  validator.validate(asset("empty.yml")).should have_validation_error(2)
end
</pre>

All you need to do is to add this to your `Gemfile`
<pre>
group :development, :test do
  gem "rspec-kwalify"
end
</pre>

## Examples

<pre>
it "should have 2 errors" do
  validator.validate(asset("empty.yml")).should have_error(2)
end

it "should have 'foo' key" do
  validator.validate(asset("empty.yml")).should have_error(/key 'foo:' is required/)
end

it "should have validation error" do
  validator.validate(asset("empty.yml")).should have_validation_error
end
</pre>
