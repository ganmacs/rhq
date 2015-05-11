require 'rhq/actions/base'

module Rhq
  module Action
    class List < Base
      def call
        traverse_local_repo do |e|
          puts fullpath? ? e.full_path : e.rel_path
        end
      end

      private

      def traverse_local_repo(&block)
        Dir.glob("#{root_path}/**/")
          .select { |e| Dir.exist?("#{e}/.git") }
          .map { |full_path| LocalRepo.new_from_full_path(full_path) }
          .each { |e| block.call(e) }
      end

      def fullpath?
        opts[:fullpath]
      end

      def opts
        @opts ||= Slop.parse(@args, suppress_errors: true) do |opts|
          opts.bool '-p', '--fullpath', 'show fullpath'
        end
      end
    end
  end
end
