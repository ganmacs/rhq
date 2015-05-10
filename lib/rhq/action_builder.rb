require 'rhq/actions/list'

module Rhq
  class ActionBuilder
    def initialize(type)
      @type = type
    end

    def call
      case @type
      when 'list'
        Rhq::Action::List.new
      else
        raise "invalid type: #{@type}"
      end
    end
  end
end
