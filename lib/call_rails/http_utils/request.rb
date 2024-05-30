# frozen_string_literal: true

# Defines HTTP request methods
module CallRails
  module HttpUtils
    # Defines HTTP request methods
    module Request
      # Perform an HTTP GET request
      def get(path, options = {})
        request(:get, path, options)
      end

      # Perform an HTTP POST request
      def post(path, options = {})
        request(:post, path, options)
      end

      private

      def request(method, path, options)
        http_response = connection.send(method) do |request|
          case method
          when :get
            request.url(path, options)
          when :post, :put
            request.headers['Content-Type'] = 'application/json'
            request.body                    = options.to_json unless options.empty?
            request.url(path)
          end
          request.options.timeout      = 120 # read timeout
          request.options.open_timeout = 300 # connection timeout
        end

        http_response.body
      end
    end
  end
end
