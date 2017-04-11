require 'redis'
require 'redis/objects'

if Rails.env.test? || Rails.env.development? || ENV['REDIS_URL'].present?
  REDIS_CONFIG = YAML.load(File.open(Rails.root.join('config/redis.yml')))
  config = REDIS_CONFIG[Rails.env].symbolize_keys

  redis = Redis.new(config)
  Redis::Objects.redis = redis
end

redis.flushdb if Rails.env.test?
