# frozen_string_literal: true

module FaradayMiddleware
  class CallRailsOAuth < Faraday::Middleware
    def initialize(app, access_token)
      @app          = app
      @access_token = access_token
    end

    def call(env)
      env[:request_headers].merge!('Authorization' => "Token token=#{@access_token}")
      @app.call env
    end
  end
end
