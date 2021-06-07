CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.fog_provider = 'fog/aws'                        # required
    config.fog_public = true
    config.storage = :fog
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV["AWS_ACCESS_KEY"],        # required
      aws_secret_access_key: ENV["AWS_SECRET_KEY"],        # required
      region:                ENV["AWS_REGION"]                            
    }
    config.fog_directory  = ENV["AWS_BUCKET"]              # required
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
end