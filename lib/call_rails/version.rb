# frozen_string_literal: true

module CallRails
  class Version
    MAJOR = 0 unless defined? CallRails::Version::MAJOR
    MINOR = 1 unless defined? CallRails::Version::MINOR
    PATCH = 0 unless defined? CallRails::Version::PATCH

    class << self
      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH].compact.join('.')
      end
    end
  end
end
