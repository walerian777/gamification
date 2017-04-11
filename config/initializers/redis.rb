require 'redis'
require 'redis/objects'

REDIS_CONFIG = YAML.load(File.open(Rails.root.join('config/redis.yml')))
config = REDIS_CONFIG[Rails.env].symbolize_keys

if !Rails.env.production? || ENV['REDIS_URL'].present?
  redis = Redis.new(config)
  Redis::Objects.redis = redis
end

redis.flushdb if Rails.env.test?
