require 'rhq/url'
require 'uri'
require 'pathname'

module Rhq
  class LocalRepo
    class << self
      def new_from_full_path(full_path)
        new('https://' + full_path.gsub(%r{\A#{Url.root_path}/}, '')) # FIXME
      end
    end

    def initialize(path)
      @path = path
    end

    def full_path
      @full_path ||= "#{Url.root_path}/#{rel_path}"
    end

    def rel_path
      @rel_path ||= "#{host}#{path}"
    end

    # if `rel_path` is github.com/ganamcs/rhq
    # then return ["github.com/ganamcs/rhq", "ganamcs/rhq", "rhq"]
    def path_parts
      @path_parts ||= begin
          parts = rel_path.split('/')
          parts.map.with_index  do |_, i|
            parts.slice(i..-1).join('/')
          end
        end
    end

    def exist?
      File.exist?(full_path)
    end

    private

    def path
      @_path ||=
        if uri.path[0] == '/'
          uri.path
        else
          '/' + uri.path
        end
    end

    def host
      @host ||= (uri.host || 'github.com')
    end

    def uri
      @uri ||= URI.parse(trimed_git_path)
    end

    def trimed_git_path
      if @path.end_with?('.git')
        @path.sub(/\.git\Z/, '')
      else
        @path
      end
    end
  end
end
