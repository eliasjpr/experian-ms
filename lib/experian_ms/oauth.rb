
module ExperianMS
  module OAuth
    attr_accessor :oauth_response

    def authenticate
      @oauth_response = HTTParty.post(oauth2_endpoint,
                                      headers: header_params,
                                      body: body_params).parsed_response
    end

    def grant_header
      { "Authorization" => "Bearer #{access_token}" }
    end

    private

    def header_params
      { "Content-Type" => "application/x-www-form-urlencoded" }
    end

    def body_params
      "username=#{key}&password=#{secret}&grant_type=password&client_id=#{client_id}"
    end

    def access_token
      oauth_response["access_token"]
    end

    def token_type
      oauth_response["token_type"]
    end

    def expires_in
      oauth_response["expires_in"]
    end

    def refresh_token
      oauth_response["refresh_token"]
    end
  end
end
