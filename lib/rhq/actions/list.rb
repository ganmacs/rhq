require 'rhq/actions/base'
require 'rhq/runner'

module Rhq
  module Action
    class List < Base
      def call
        travarse.each do |e|
          puts e
        end
      end

      private

      def travarse
        Dir.glob("#{root_dir}/**/").select { |e| Dir.exist?("#{e}/.git") }
      end

      def root_dir
        @root_dir ||= File.expand_path(root)
      end

      def root
        Runner.new.run('git', 'config', '--null', '--get', 'ghq.root')[:stdout]
      end
    end
  end
end
