require 'rhq/actions/base'

module Rhq
  module Action
    class Root < Base
      def call
        puts root_path
      end

      def opts
        []
      end
    end
  end
end
