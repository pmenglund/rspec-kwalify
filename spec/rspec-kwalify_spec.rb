require "spec_helper"

describe RSpec::Kwalify do

  SCHEMA = asset("schema.yml")

  let(:schema) { Kwalify::Yaml.load_file(SCHEMA) }
  let(:validator) { Kwalify::Validator.new(schema) }

  describe "base object" do
    it "should raise an error on String" do
      lambda {
        RSpec::Kwalify::HaveError.new("String").matches?([])
      }.should raise_error ArgumentError
    end
  end

  describe "rspec" do
    describe "#have_error" do
      it "should pass on a nil argument" do
        validator.validate(load_yaml("empty.yml")).should have_error
      end

      it "should pass on a Fixnum argument" do
        validator.validate(load_yaml("empty.yml")).should have_error(1)
      end

      it "should pass on a Regexp argument" do
        validator.validate(load_yaml("empty.yml")).should have_error(/key 'foo:' is required/)
      end
    end

    describe "#have_validation_error" do
      it "should pass on a nil argument" do
        validator.validate(load_yaml("empty.yml")).should have_validation_error
      end

      it "should pass on a Fixnum argument" do
        validator.validate(load_yaml("empty.yml")).should have_validation_error(1)
      end

      it "should pass on a Regexp argument" do
        validator.validate(load_yaml("empty.yml")).should have_validation_error(/key 'foo:' is required/)
      end
    end

    describe "#have_syntax_error" do
      it "should pass on a nil argument" do
        pending "find a way to force a 'Kwalify::SyntaxError'"
        validator.validate(load_yaml("syntax.yml")).should have_syntax_error
      end
    end

  end

end
