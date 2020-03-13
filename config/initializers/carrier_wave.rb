if Rails.env.production?
    CarrierWave.configure do |config|
      config.fog_credentials = {
        # Configuration for Amazon S3
        :provider              => 'AWS',
        :aws_access_key_id     => ENV['AKIAIR4GR6ZMQXYQWOHQ'],
        :aws_secret_access_key => ENV['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']
      }
      config.fog_directory     =  ENV['collabot']
      config.fog_provider = 'fog/aws'
    end
  end