CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.fog_provider = 'fog/aws'                        # required
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV["AWS_ACCESS_KEY"],        # required
      aws_secret_access_key: ENV["AWS_SECRET_KEY"],        # required
      region: 'ap-southeast-1'                             # Singapore
    }
    config.fog_directory  = ENV["AWS_BUCKET"]              # required
    config.storage = :fog
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
end