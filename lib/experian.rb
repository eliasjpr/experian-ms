require File.expand_path('../experian/configuration', __FILE__)
require File.expand_path('../experian/api', __FILE__)
module Experian
  extend Configuration
  # Alias for Experian::Api.new
  # @return [Experian::Api]
  def self.api(options={})
    Experian::API.new(options)
  end
end
