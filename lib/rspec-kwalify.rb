require "kwalify"
require "rspec-kwalify/version"

module RSpec
  module Kwalify

    # @author Martin Englund
    class HaveError
      def initialize(error, base_error=::Kwalify::BaseError)
        @error = error
        @base_error = base_error
      end

      def matches?(errors)
        @errors = errors

        if @error.nil?
          @errors.any? { |error| error.is_a?(@base_error) }
        elsif @error.is_a?(Regexp)
          @errors.any? do |error|
            error.is_a?(@base_error) && error.message.match(@error)
          end
        elsif @error.is_a?(Fixnum)
          @errors.size == @error
        else
          raise ArgumentError, "don't know how to handle a #{@error.class}"
        end
      end

      def failure_message_for_should
        msg = "expected errors to contain '%s' but was '%s'"
        if @error.nil?
          errors = @errors.map { |e| e.class.name }.uniq
          msg % [@base_error, errors.join(", ")]
        elsif @error.is_a?(Regexp)
          errors = @errors.map { |e| e.message }.uniq
          msg % [@error.source, errors.join(", ")]
        elsif @error.is_a?(Fixnum)
          "expected #{@error} errors, found #{@errors.size}"
        end
      end
    end

  end
end

# @overload have_error
#   Matches if it has an error that `is_a?` [Kwalify::BaseError]
#   @return [RSpec::Kwalify::HaveError]
# @overload have_error(count)
#   Matches if the number of errors is equal to `count`
#   @param [Fixnum] count
#   @return [RSpec::Kwalify::HaveError]
# @overload have_error(regexp)
#   Matches if the error message matches the regexp
#   @param [Regexp] regexp
#   @return [RSpec::Kwalify::HaveError]
def have_error(error=nil)
  RSpec::Kwalify::HaveError.new(error)
end

# @overload have_validation_error
#   Matches if it has an error that `is_a?` [Kwalify::ValidationError]
#   @return [RSpec::Kwalify::HaveError]
# @overload have_validation_error(count)
#   Matches if the number of errors is equal to `count`
#   @param [Fixnum] count
#   @return [RSpec::Kwalify::HaveError]
# @overload have_validation_error(regexp)
#   Matches if the error message matches the regexp
#   @param [Regexp] regexp
#   @return [RSpec::Kwalify::HaveError]
def have_validation_error(error=nil)
  RSpec::Kwalify::HaveError.new(error, ::Kwalify::ValidationError)
end

# have_syntax_error
def have_syntax_error(error=nil)
  RSpec::Kwalify::HaveError.new(error, ::Kwalify::SyntaxError)
end
