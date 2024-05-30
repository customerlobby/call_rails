# frozen_string_literal: true

module CallRails
  class Client < CallRails::API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each { |f| require f }

    include CallRails::Client::Accounts
    include CallRails::Client::Calls
  end
end
