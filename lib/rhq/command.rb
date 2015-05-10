require 'rhq/actions/list'
require 'rhq/actions/get'

module Rhq
  class Command
    def initialize(args)
      @args = args
    end

    def call
      case action_type
      when 'get'
        get
      when 'list'
        list
      else
        raise "Invalid type: #{action_type}"
      end
    end

    private

    def get
      Rhq::Action::Get.new(@args).call
    end

    def list
      Rhq::Action::List.new([]).call
    end

    def action_type
      @args.first
    end
  end
end
