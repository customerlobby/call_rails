# frozen_string_literal: true

module CallRails
  class Client
    # module to fetch Accounts
    module Accounts
      def accounts(params = {})
        get("a.json", params)
      end

      def account(id, params = {})
        get("a/#{id}", params)
      end
    end
  end
end
