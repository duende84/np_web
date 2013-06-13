CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider           => 'Rackspace',
    :rackspace_username => 'duende84',
    :rackspace_api_key  => '51f4d381c27b624c10384ba6d147ea8d',
    :rackspace_region   => :dfw
  }
end