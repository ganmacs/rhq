require 'slop'
require 'rhq/remote_repo'
require 'rhq/local_repo'
require 'rhq/backends/git'

module Rhq
  module Action
    class Base
      def initialize(args)
        @args = args
      end

      def call
        raise NotImplementedError
      end

      private

      def target_path
        opts.args[1] or raise 'Require clone path'
      end

      # retrun Slop object
      def opts
        raise NotImplementedError
      end

      # TODO use buidler class
      def backend
        @backend ||= Backend::Git.new
      end

      def local_repo
        @local_repo ||= LocalRepo.new(@args[1])
      end

      def remote_repo
        @remote_repo ||= RemoteRepo.new(@args[1])
      end

      def root_path
        @root_dir ||= File.expand_path(root)
      end

      def root
        Runner.new.run('git', 'config', '--null', '--get', 'ghq.root')[:stdout]
      end
    end
  end
end
