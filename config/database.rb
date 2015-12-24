require 'aws-sdk'
require 'dynamoid'

Dynamoid.configure do |config|
  config.adapter = 'aws_sdk_v2' # This adapter establishes a connection to the DynamoDB servers using Amazon's own AWS gem.
  config.warn_on_scan = false # Output a warning to the logger when you perform a scan rather than a query on a table.
  config.read_capacity = 2 # Read capacity for your tables
  config.write_capacity = 2 # Write capacity for your tables
end
