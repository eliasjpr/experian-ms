module ExperianMS
  module Configuration
    BASE_URL        = 'https://ats.eccmp.com'.freeze
    CONTENT_TYPE    = 'application/xml'.freeze
    CUSTOMER_ID     = 0
    API_VERSION     = 1
    FORM_GROUP_ID   = 1
    KEY             = ''
    SECRET          = ''
    CLIENT_ID       = ''
    OAUTH2_ENDPOINT = 'https://ats.eccmp.com/ats/oauth2/Token'.freeze
    VALID_OPTIONS_KEYS = [:base_url,
                          :customer_id,
                          :api_version,
                          :form_group_id,
                          :key, :secret,
                          :client_id,
                          :oauth2_endpoint,
                          :content_type]

    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
       option.merge!(key => send(key))
      end
    end

    # Reset all configuration options to defaults
    def reset
      self.base_url        = BASE_URL
      self.customer_id     = CUSTOMER_ID
      self.api_version     = API_VERSION
      self.form_group_id   = FORM_GROUP_ID
      self.key             = KEY
      self.secret          = SECRET
      self.client_id       = CLIENT_ID
      self.oauth2_endpoint = OAUTH2_ENDPOINT
      self.content_type    = CONTENT_TYPE
    end

  end
end
