require 'slop'

module Rhq
  module Action
    class Base
      def initialize(args)
        @args = args
      end

      def call
        raise NotImplementedError
      end
    end
  end
end
