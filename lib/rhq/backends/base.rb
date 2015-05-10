require 'rhq/runner'
module Rhq
  module Backend
    class Base
      def clone(remote, local)
        if local.exist?
          print "destination path(#{local.full_path}) is already exist.\n"
        else
          result = Runner.new.run(command, remote.full_path, local.url)
          raise result[:stderr] if result[:status] != 0
        end
      end
    end
  end
end
