require 'httparty'
require File.expand_path('../oauth', __FILE__)
module Experian
  class API
    include HTTParty
    include OAuth

    attr_accessor  *Configuration::VALID_OPTIONS_KEYS
    base_uri Configuration::BASE_URL

    # Creates a new API
    def initialize(options={})
      options = Experian.options.merge(options)
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

    def request(xml)
      authenticate
      post(xml)
    end

    private

    def post(xml)
      self.class.post('/ats/XmlPost/PostSecureAuth2/',
                      headers:grant_header,
                      body: xml,
                      debug_output: $stdout).parsed_response
    end


  end
end
