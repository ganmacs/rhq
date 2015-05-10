require 'rhq/actions/base'

module Rhq
  module Action
    class Get < Base
      def call
        target_path
        backend.clone(remote_repo, local_repo)
      end
    end
  end
end
