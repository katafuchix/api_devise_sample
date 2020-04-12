# https://qiita.com/junara/items/1899f23c091bcee3b058
unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIA2MVLAI2ARNUFJ2AO',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'papa-staging'
    config.cache_storage = :fog
  end
end

module CarrierWave
  module RMagick
    MB = 10**6
    attr_reader :property
    def set_property
      image = Magick::Image.read(current_path).shift
      @property = { width: image.columns, height: image.rows, filesize_mb: image.filesize / MB }
    end
  end
end
