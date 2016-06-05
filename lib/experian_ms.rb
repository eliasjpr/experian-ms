require File.expand_path('../experian_ms/configuration', __FILE__)
require File.expand_path('../experian_ms/api', __FILE__)
module ExperianMS
  extend Configuration
  # Alias for ExperianMS::Api.new
  # @return [ExperianMS::Api]
  def self.api(options={})
    ExperianMS::API.new(options)
  end
end
