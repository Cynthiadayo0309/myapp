require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
    if Rails.env.production?
        config.storage :fog
        config.fog_provider = 'fog/aws'
        config.fog_directory = ENV['AWS_BUCKET']
        config.fog_credentials = {
            :provider => 'AWS',
            :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
            :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
            :region => ENV['AWS_DEFAULT_REGION']
        }
    end
end

# 日本語の文字化けを防ぐ
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/