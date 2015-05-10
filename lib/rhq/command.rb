require 'rhq/action_builder'

module Rhq
  class Command
    def initialize(args)
      @args = args
    end

    def call
      action.call
    end

    private

    def action
      @action ||= Rhq::ActionBuilder.new(action_type).call
    end

    def action_type
      @args[0]
    end
  end
end
