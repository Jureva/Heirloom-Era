if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY'],
      :s3_host_name => 's3-eu-west-1.amazonaws.com',
      :s3_protocol => 'https',
      :s3_permission => :private
    }
    config.fog_directory     =  ENV['S3_BUCKET']
  end
end