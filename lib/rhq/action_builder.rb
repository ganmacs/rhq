require 'rhq/actions/list'
require 'rhq/actions/get'
require 'rhq/actions/root'

module Rhq
  class ActionBuilder
    def initialize(type)
      @type = type
    end

    def build(args)
      action_class.new(args)
    end

    private

    def action_class
      @action_class ||=
        case @type
        when 'get'
          Action::Get
        when 'list'
          Action::List
        when 'root'
          Action::Root
        else
          raise "Invalid action type: #{@type}"
        end
    end
  end
end
