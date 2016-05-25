require_relative '../spec_helper'
RSpec.describe Experian do
  # Configure Experian API
  Experian.configure do |config|
    config.key           = ''
    config.secret        = ''
    config.client_id     = 0
    config.customer_id   = 0
    config.api_version   = 1
    config.form_group_id = 1
  end

  # Returns a new instance of the API
  let(:client) { Experian.api }

  describe "attributes" do
    it 'must include HTTParty' do
      expect(Experian::API).to include(HTTParty)
    end

    it 'must have base uri set to Experian API endpoint' do
      expect(Experian::API.base_uri).to eq 'https://ats.eccmp.com'
    end
  end

  context '#authenticate' do
    before do
      VCR.insert_cassette 'client_auth', :record => :new_episodes
      client.authenticate
    end

    after do
      VCR.eject_cassette
    end

    it 'returns JSON response' do
      expect(client.oauth_response).to be_kind_of Hash
    end

    it 'granted authorization' do
      expect(client.grant_header).to be_kind_of Hash
    end

    it 'is not a Bad Request' do
      expect(client.oauth_response).to_not eq 'Bad Request'
    end
  end

  describe "#request" do
    let(:payload) { File.read('./spec/fixtures/xml/new_user.xml').chomp }
    before do
      VCR.insert_cassette 'new_user_post', :record => :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it "posts xml successfully to Experia API" do
      expect(client.request(payload)).to eq "Data saved and pending processing."
    end
  end
end
