require 'rhq/actions/list'
require 'rhq/actions/get'
require 'rhq/actions/root'

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
      when 'root'
        root
      else
        raise "Invalid type: #{action_type}"
      end
    end

    private

    def get
      Rhq::Action::Get.new(@args).call
    end

    def list
      Rhq::Action::List.new(@args).call
    end

    def root
      Rhq::Action::Root.new(@args).call
    end

    def action_type
      @args.first
    end
  end
end
