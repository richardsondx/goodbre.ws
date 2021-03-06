require "redis"
require "resque"
require "resque-loner"

# Recommendable requires a connection to a running redis-server. Either create
# a new instance based on a host/port or UNIX socket, or pass in an existing
# Redis client instance.
Recommendable.redis = Redis.new(:host => "localhost", :port => 6379)

# Connect to Redis via a UNIX socket instead
# Recommendable.redis = Redis.new(:sock => "")

# Tell Redis which database to use (usually between 0 and 15). The default of 0
# is most likely okay unless you have another application using that database.
# Recommendable.redis.select "0"
