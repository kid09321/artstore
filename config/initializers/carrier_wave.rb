CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIAINJJFMZYBZTDDY5A',      # 你的 key

      aws_secret_access_key: '2vqjBXPZa9cXTIu3oDLreLeyt88ioq48D3oiQt96',      # 你的 secret key

      region:                'Tokyo' # 你的 S3 bucket 的 Region 位置

    }
    config.fog_directory  = 'artstorepicture' # 你設定的 bucket name

  else
    config.storage :file
  end
end
