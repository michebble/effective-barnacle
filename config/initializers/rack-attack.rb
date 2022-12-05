class Rack::Attack
  Rack::Attack.enabled = true
  ### Configure Cache ###

  # If you don't want to use Rails.cache (Rack::Attack's default), then
  # configure it here.
  #
  # Note: The store is only used for throttling (not blocklisting and
  # safelisting). It must implement .increment and .write like
  # ActiveSupport::Cache::Store

  # Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  # Throttle graphql requests by ip

  throttle("graphql/ip", limit: 1000, period: 1.day) do |req|
    req.ip if req.path == "/graphql"
  end
end
