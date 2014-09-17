require 'helper'
 
describe 'configuration' do
 
  describe '.api_key' do
    it 'should return default key' do
      EbayCommerce.api_key.must_equal EbayCommerce::Configuration::DEFAULT_API_KEY
    end
  end
 
  describe '.format' do
    it 'should return default format' do
      EbayCommerce.format.must_equal EbayCommerce::Configuration::DEFAULT_FORMAT
    end
  end
 
  describe '.user_agent' do
    it 'should return default user agent' do
      EbayCommerce.user_agent.must_equal EbayCommerce::Configuration::DEFAULT_USER_AGENT
    end
  end
 
  describe '.method' do
    it 'should return default http method' do
      EbayCommerce.method.must_equal EbayCommerce::Configuration::DEFAULT_METHOD
    end
  end

  after do
    EbayCommerce.reset
  end
 
  describe '.configure' do
    EbayCommerce::Configuration::VALID_CONFIG_KEYS.each do |key|
      it "should set the #{key}" do
        EbayCommerce.configure do |config|
          config.send("#{key}=", key)
          EbayCommerce.send(key).must_equal key
        end
      end
    end
  end

  EbayCommerce::Configuration::VALID_CONFIG_KEYS.each do |key|
    describe ".#{key}" do
      it 'should return the default value' do
        EbayCommerce.send(key).must_equal EbayCommerce::Configuration.const_get("DEFAULT_#{key.upcase}")
      end
    end
  end
  
end