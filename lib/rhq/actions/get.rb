require 'rhq/actions/base'

module Rhq
  module Action
    class Get < Base
      def call
        target_path
        backend.clone(remote_repo, local_repo)
      end

      private

      def opts
        @opts ||= Slop.parse(@args, suppress_errors: true)
      end
    end
  end
end
