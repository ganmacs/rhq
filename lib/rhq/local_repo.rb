require 'uri'
require 'pathname'

module Rhq
  class LocalRepo
    # args is path
    def initialize(path)
      @path = expand(path)
    end

    def path
      @path.to_s
    end

    def exist?
      return false if @path.nil?
      File.exist?(@path)
    end

    private

    def expand(path)
      uri = URI.parse(path)
      p = uri.path
      p = p.sub(/\.git\Z/, '') if p.end_with?('.git')
      p.insert(0, '/') if p[0] != '/'
      host = uri.host || 'github.com'
      Pathname.new(root_dir + '/' + host + p)
    end

    def root_dir
      File.expand_path(root)
    end

    def root
      Runner.new.run('git', 'config', '--null', '--get', 'ghq.root')[:stdout]
    end
  end
end
