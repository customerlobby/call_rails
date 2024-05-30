# frozen_string_literal: true

module CallRails
  module Configuration
    VALID_OPTIONS_KEYS = [
      :api_key,
      :api_version,
      :adapter,
      :endpoint
    ].freeze

    # By default don't set the api key.
    DEFAULT_API_KEY = nil

    # Use the default Faraday adapter.
    DEFAULT_ADAPTER = Faraday.default_adapter

    # By default use the main api URL.
    DEFAULT_ENDPOINT = 'api.callrail.com'.freeze

    DEFAULT_API_VERSION = '/v3'.freeze

    attr_accessor *VALID_OPTIONS_KEYS

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # When this module is extended, reset all settings.
    def self.extended(base)
      base.reset
    end

    # Reset all configuration settings to default values.
    def reset
      self.api_key     = DEFAULT_API_KEY
      self.api_version = DEFAULT_API_VERSION
      self.endpoint    = DEFAULT_ENDPOINT
      self.adapter     = DEFAULT_ADAPTER
    end
  end
end
