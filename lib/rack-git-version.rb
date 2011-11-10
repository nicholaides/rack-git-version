require "rack-git-version/version"

module Rack
  class GitVersion
    def initialize app
      @app = app
    end

    def git_version
      @@git_version ||= `git describe --always`.strip
    end

    def call env
      status, headers, body = @app.call env
      headers["X-Git-Version"] ||= git_version
      [status, headers, body]
    end
  end
end
