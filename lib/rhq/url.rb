module Rhq
  class Url
    class << self
      alias_method :_new, :new

      def instance
        @instance ||= _new
      end

      def new
        Url.instance
      end

      def root_path
        instance.root_path
      end
    end

    def root_path
      @root_path ||= File.expand_path(root)
    end

    private

    def root
      ret = Runner.new.run('git', 'config', '--null', '--get', 'ghq.root')
      raise ret[:stderr] if ret[:status] != 0
      ret[:stdout]
    end
  end
end
