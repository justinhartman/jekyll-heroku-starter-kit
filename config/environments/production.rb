client = Dalli::Client.new((ENV["MEMCACHIER_SERVERS"] || "").split(","),
                           :username => ENV["MEMCACHIER_USERNAME"],
                           :password => ENV["MEMCACHIER_PASSWORD"],
                           :failover => true,
                           :socket_timeout => 1.5,
                           :socket_failure_delay => 0.2,
                           :value_max_bytes => 10485760)
config.action_dispatch.rack_cache = {
  :metastore    => client,
  :entitystore  => client
}
config.static_cache_control = "public, max-age=2592000"
config.action_controller.perform_caching = true
