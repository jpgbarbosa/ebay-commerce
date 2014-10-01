require 'ebay_commerce/version'

module EbayCommerce
  module Configuration
    VALID_CONNECTION_KEYS = [:endpoint, :user_agent, :method, :zone, :version].freeze
    VALID_OPTIONS_KEYS    = [:api_key, :format, :tracking_id].freeze
    VALID_CONFIG_KEYS     = VALID_CONNECTION_KEYS + VALID_OPTIONS_KEYS

    # DEFAULT_DEVELOPMENT_ENDPOINT    = 'http://sandbox.api.ebaycommercenetwork.com/publisher'
    # DEFAULT_PRODUCTION_ENDPOINT   = 'http://api.ebaycommercenetwork.com/publisher'

    DEFAULT_VERSION     = "3.0"
    DEFAULT_METHOD      = :get
    DEFAULT_USER_AGENT  = "EbayCommerce API Ruby Gem #{EbayCommerce::VERSION}".freeze

    DEFAULT_API_KEY      = nil
    DEFAULT_TRACKING_ID  = nil
    DEFAULT_FORMAT       = :json

    DEFAULT_ZONE         = nil

    # Build accessor methods for every config options so we can do this, for example:
    #   EbayCommerce.format = :xml
    attr_accessor *VALID_CONFIG_KEYS

    # Make sure we have the default values set when we get 'extended'
    def self.extended(base)
      base.reset
    end

    def reset
      self.endpoint   = "DEFAULT_DEVELOPMENT_ENDPOINT"

      self.method     = DEFAULT_METHOD
      self.user_agent = DEFAULT_USER_AGENT
      self.version    = DEFAULT_VERSION

      self.api_key      = DEFAULT_API_KEY
      self.tracking_id  = DEFAULT_TRACKING_ID
      self.format       = DEFAULT_FORMAT
      self.zone         = DEFAULT_ZONE
    end

    def configure
      yield self
    end

    def options
      Hash[ * VALID_CONFIG_KEYS.map { |key| [key, send(key)] }.flatten ]
    end

  end # Configuration
end