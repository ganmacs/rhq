require 'open3'
require 'pathname'
require 'rhq/actions/base'
require 'find'
require 'pp'

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
        @root_dir ||= File.expand_path(run[0].strip)
      end

      def run
        stdout, stderr, status = Open3.capture3('git config --null --get ghq.root')
      end
    end
  end
end
