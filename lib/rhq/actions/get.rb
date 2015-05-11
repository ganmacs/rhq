require 'rhq/actions/base'

module Rhq
  module Action
    class Get < Base
      def call
        backend.clone(remote_repo, local_repo, )
      end

      private

      def remote_repo
        @remote_repo ||= RemoteRepo.new(target_path, ssh?)
      end

      def ssh?
        opts[:p]
      end

      def opts
        @opts ||= Slop.parse(@args, suppress_errors: true) do |opts|
          opts.bool '-p', 'with ssh'
        end
      end
    end
  end
end
