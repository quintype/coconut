class QtConfig < Quintype::API::Config
  ConfigCache = SoftEvictCache::SingleValueCache.build(120, 600) do
    Rails.logger.info("fetching config")
    get_without_caching
  end

  class << self
    def get_with_caching
      ConfigCache.value
    end
    alias_method_chain :get, :caching
  end
end
