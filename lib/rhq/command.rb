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
      @action ||= ActionBuilder.new(action_type).build(@args)
    end

    def action_type
      @args.first
    end
  end
end
