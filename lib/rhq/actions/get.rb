require 'rhq/actions/base'
require 'rhq/remote_repo'
require 'rhq/local_repo'
require 'rhq/backends/git'

module Rhq
  module Action
    class Get < Base
      def call
        backend.clone(remote_repo, local)
      end

      private

      # TODO use buidler class
      def backend
        @backend ||= Backend::Git.new
      end

      def local
        @local ||= LocalRepo.new(@args[1])
      end

      def remote_repo
        @remote_repo ||= RemoteRepo.new(@args[1])
      end
    end
  end
end
