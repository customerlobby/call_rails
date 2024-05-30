# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'

require_relative "call_rails/version"
require_relative "call_rails/configuration"
require_relative "call_rails/api"
require_relative "call_rails/client"
require_relative "call_rails/error"
require_relative "faraday/auth"
require_relative "faraday/raise_exception"

module CallRails
  extend Configuration
  # Alias for CallRails::Client.new
  # @return [CallRails::Client]
  def self.client(options = {})
    CallRails::Client.new(options)
  end

  # Delegate to CallRails::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)

    client.send(method, *args, &block)
  end
end
