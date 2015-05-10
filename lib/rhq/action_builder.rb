require 'rhq/actions/list'
require 'rhq/actions/get'
require 'rhq/actions/root'

module Rhq
  class ActionBuilder
    def initialize(type)
      @type = type
    end

    def build(args)
      case @type
      when 'get'
        Action::Get.new(args)
      when 'list'
        Action::List.new(args)
      when 'root'
        Action::Root.new(args)
      else
        raise "Invalid action type: #{@type}"
      end
    end
  end
end
