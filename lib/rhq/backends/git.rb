require 'rhq/backends/base'

module Rhq
  module Backend
    class Git < Base
      def command
        'git clone'
      end
    end
  end
end
