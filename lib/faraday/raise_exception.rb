# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'nokogiri'

module FaradayMiddleware
  class RaiseException < Faraday::Middleware

    def initialize(app)
      super(app)
    end

    def call(env)
      begin
        @app.call(env)
      rescue Faraday::ConnectionFailed, Faraday::TimeoutError => e
        raise CallRails::ConnectionError.new(e)
      rescue Faraday::ParsingError => e
        if e.message.squish.include? ('<body>')
          html          = Nokogiri::HTML.parse(e.message.split('\'')[1])
          error_message = html.css('p').text
          if error_message.include? 'ID is not valid'
            raise CallRails::RecordNotFoundError.new(error_message)
          else
            raise CallRails::BadRequestError.new(error_message)
          end
        else
          raise CallRails::AuthorizationError.new(e)
        end
      end
    end
  end
end
