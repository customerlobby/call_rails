# frozen_string_literal: true

module CallRails
  class Client
    # module to fetch Calls
    module Calls
      def calls(account_id, params = {})
        get("a/#{account_id}/calls.json", params)
      end

      def call(account_id, call_id, params = {})
        get("a/#{account_id}/calls/#{call_id}.json", params)
      end

      def summary(account_id, params = {})
        get("a/#{account_id}/calls/summary.json", params)
      end
    end
  end
end
