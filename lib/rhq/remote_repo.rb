require 'uri'

module Rhq
  class RemoteRepo
    # @path String
    def initialize(path, ssh = false)
      @path = path
      @ssh = ssh
    end

    def url
      path
    end

    private

    def path
      @_path ||= build_path
    end

    def build_path
      if uri.relative?
        uri.scheme = 'https'
        uri.host = 'github.com'
        uri.path.insert(0, '/') if uri.path[0] != '/'
      end

      trimed_git_path(@ssh ? ssh_path : uri.to_s)
    end

    def uri
      @uri ||= URI.parse(@path)
    end

    def ssh_path
      "git@#{uri.host}:#{trim_slash(uri.path)}"
    end

    def trim_slash(path)
      if path[0] == '/'
        path[1..-1]
      else
        path
      end
    end

    def trimed_git_path(path)
      if path.end_with?('.git')
        path.sub(/\.git\Z/, '')
      else
        path
      end
    end
  end
end
