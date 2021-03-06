require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'


CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory = ENV['AWS_BUCKET']
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
        aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
        region: ENV['AWS_DEFAULT_REGION']
    }
end

# 日本語の文字化けを防ぐ
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/