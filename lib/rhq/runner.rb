require 'open3'

module Rhq
  class Runner
    def self.new
      return @instance unless @instance.nil?
      @instance = super
    end

    def run(command, *args)
      script = build_script(command, args)
      stdout, stderr, status = Open3.capture3(script)
      { stdout: stdout.strip, stderr: stderr, status: status }
    end

    private

    def build_script(command, args)
      command + ' ' + args.join(' ')
    end
  end
end
