require 'httparty'
require 'ebay_commerce/configuration'
require 'ebay_commerce/error'
require 'ebay_commerce/version'

module EbayCommerce
  extend Configuration

  class Client
    include HTTParty

    headers 'User-Agent' => EbayCommerce.options[:user_agent]

    class << self

      # Check every response for errors and raise
      def perform_request(http_method, path, options, &block)
        response = super(http_method, path, options, &block)

        check_response(response)

        response
      end

      def check_response(response)
        raise EbayCommerce::Error.from_response(response) if response.code >= 400
      end

    end

    # Define the same set of accessors as the EbayCommerce module
    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(options={})
      # Merge the config values from the module and those passed to the class.
      options.delete_if { |k, v| v.nil? }

      url = ""
      url += options[:endpoint]
      url += "/"+EbayCommerce.options[:version]+"/"+EbayCommerce.options[:format].to_s
      base_uri url

      # Merge the config values from the module and those passed
      # to the client.
      @merged_options = EbayCommerce.options.merge(options)

      # Copy the merged values to this client and ignore those
      # not part of our configuration
      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", @merged_options[key])
      end
    end

    def general_search params
      response = make_get_request("/GeneralSearch", authentication_params.merge(params))
    end

    private

    def make_post_request url, body, headers = {'Content-Type' => 'application/json'}
      self.class.post(url.to_s, :body => body, :headers => headers)
    end

    def make_get_request url, params
      self.class.get(url.to_s, query: params)
    end

    def authentication_params
      {
        apiKey: @merged_options[:api_key],
        trackingId: @merged_options[:tracking_id]
      }
    end

  end # Client

end
