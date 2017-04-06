require 'redis'
require 'redis/objects'

REDIS_CONFIG = YAML.load(File.open(Rails.root.join('config/redis.yml')))
config = REDIS_CONFIG[Rails.env].symbolize_keys

redis = Redis.new(config)
Redis::Objects.redis = redis

redis.flushdb if Rails.env.test?
