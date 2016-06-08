# Experian Marketing Suite API Integration

A Ruby wrapper that Integrates Experian Marketing Suit endpoints. At the moment
the API only supports **POST** data to Experian marketing suite.

The Experian Marketing Suite is the world's most flexible and comprehensive
cloud-based marketing platform. More than 10,000 of the world's leading brands,
in over than 30 countries, are using the Experian Marketing Suite to create and
deliver intelligent interactions with their customers, every time. Built from the
ground-up leveraging 30 years of data-driven global marketing expertise, the
award-winning Experian Marketing Suite unites Experian's customer identity,
analytics and cross-channel marketing technology..

> **Note** This wrapper only uses a single Experian Endpoint

## Installation

```ruby
gem 'experian_ms', '~> 0.1.6'
```

## Usage

```ruby
# For Pure ruby installations Require the ExperianMS module
require 'experian_ms'

# Configure the API Wrapper
# Note:
# For a rails application this can be added to an Experian initializer (config/initializers/experian_ms_conf.rb)
# and theres no need to require the module
ExperianMS.configure do |config|
  config.key           = 'your-oauth2-key' # OAuth2 Consumer Key
  config.secret        = 'your-oauth2-secret' # OAuth2 Secret Key
  config.client_id     = 0 # Client id provided by Experian
  config.customer_id   = 0 # Customer id provided by Experian
  config.api_version   = 0 # Experian API version
  config.form_group_id = 0 # Form group id provided by Experian
end

# In your Model, Worker, Services, Controllers, etc
api_client = ExperianMS.api # Returns an Experian API instance

# Sends the items to Experian endpoint
api_client.request(xml) # See example xml payload below
```

Example **XML** Payload

```xml
<ApiSubmission ApiVersion="1" FormGroupId="1" SubmissionTrackingCode="SOMECODE" CustId="345">
  <Records SubmissionSequence="1" FormId="19" TableName="User">
    <Record>
      <Field FieldName="user_id">A</Field>
      <Field FieldName="profile_id">B</Field>
      <Field FieldName="category">C</Field>
      <Field FieldName="category_value">D</Field>
      <Field FieldName="active_ind">Y</Field>
    </Record>
  </Records>
</ApiSubmission>
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/eliasjpr/experian-ms.
This project is intended to be a safe, welcoming space for collaboration, and
contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
