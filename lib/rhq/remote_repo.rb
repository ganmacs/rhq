require 'uri'

module Rhq
  class RemoteRepo
    # @path String
    def initialize(path)
      @path = path
    end

    def url
      path.to_s
    end

    private

    def path
      @_path ||= build_path(@path)
    end

    def build_path(path)
      u = URI.parse(path)
      if u.relative?
        u.scheme = 'https'
        u.host = 'github.com'
        u.path.insert(0, '/') if u.path[0] != '/'
      end
      u
    end
  end
end
