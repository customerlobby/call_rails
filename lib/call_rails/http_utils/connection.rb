# frozen_string_literal: true

require 'faraday_middleware'
require_relative '../../faraday/auth'
require_relative '../../faraday/raise_exception'

module CallRails
  module HttpUtils
    module Connection
      private

      def connection
        options = {
          url: "https://#{endpoint}#{api_version}/"
        }

        Faraday::Connection.new(options) do |connection|
          connection.use FaradayMiddleware::CallRailsOAuth, api_key
          connection.use FaradayMiddleware::RaiseException
          connection.use FaradayMiddleware::Mashify
          connection.use Faraday::Response::ParseJson
          connection.adapter(adapter)
        end
      end
    end
  end
end
