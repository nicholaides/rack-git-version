require "rack-git-version/version"

module Rack
  class GitVersion
    def initialize app
      @app = app
    end

    def git_version
      @@git_version ||= `git describe`.strip
    end

    def call env
      status, headers, response = @app.call env
      headers["X-Git-Version"] ||= git_version
      [status, headers, response]
    end
  end
end
