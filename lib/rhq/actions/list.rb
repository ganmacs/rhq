require 'rhq/actions/base'

module Rhq
  module Action
    class List < Base
      def call
        travarse.each do |e|
          if fullpath?
            puts e.full_path
          else
            puts e.rel_path
          end
        end
      end

      private

      def travarse
        Dir.glob("#{root_path}/**/").select { |e| Dir.exist?("#{e}/.git") }.map do |full_path|
          LocalRepo.new_from_full_path(full_path)
        end
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
