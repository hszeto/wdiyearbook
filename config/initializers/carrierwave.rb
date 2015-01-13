CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AWS_ACCESS_KEY_ID',       # required
    :aws_secret_access_key  => 'AWS_SECRET_ACCESS_KEY'       # required
  }
  config.fog_directory  = 'AWS_FOG_DIRECTORY' # required
  # see https://github.com/jnicklas/carrierwave#using-amazon-s3
  # for more optional configuration
end