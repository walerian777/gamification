require 'redis'
require 'redis/objects'

if Rails.env.production?
  redis_url = ENV['REDIS_URL']
  redis = Redis.new(url: redis_url) if redis_url.present?
else
  REDIS_CONFIG = YAML.load(File.open(Rails.root.join('config/redis.yml')))
  config = REDIS_CONFIG[Rails.env].symbolize_keys

  redis = Redis.new(config)
  Redis::Objects.redis = redis

  redis.flushdb if Rails.env.test?
end
