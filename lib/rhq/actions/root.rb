require 'rhq/actions/base'

module Rhq
  module Action
    class Root < Base
      def call
        print root_dir
      end
    end
  end
end
