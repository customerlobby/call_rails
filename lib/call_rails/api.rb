# frozen_string_literal: true

require_relative 'http_utils/request'
require_relative 'http_utils/connection'
require_relative 'configuration'

module CallRails
  class API
    include HttpUtils::Request
    include HttpUtils::Connection

    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    def initialize(options = {})
      options = CallRails.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    def config
      conf = {}
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        conf[key] = send key
      end
      conf
    end
  end
end
