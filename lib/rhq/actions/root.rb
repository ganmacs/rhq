require 'rhq/actions/base'

module Rhq
  module Action
    class Root < Base
      def call
        print root_dir
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
