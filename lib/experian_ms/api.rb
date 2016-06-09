require 'httparty'
require File.expand_path('../oauth', __FILE__)
module ExperianMS
  class API
    include HTTParty
    include OAuth

    attr_accessor  *Configuration::VALID_OPTIONS_KEYS
    base_uri Configuration::BASE_URL

    # Creates a new API
    def initialize(options={})
      options = ExperianMS.options.merge(options)
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

    def request(xml, end_point = '/ats/XmlPost/PostSecureAuth2/')
      authenticate
      post(xml, end_point)
    end

    private

    def post(xml, end_point)
      self.class.post(end_point,
                      headers:grant_header,
                      body: xml,
                      debug_output: $stdout).parsed_response
    end


  end
end
