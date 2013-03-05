# 
# Helpers::Cache 
#
#
module Helpers
  module Cache
    class << self

      # simply setup the cache
      def initialize
        @cache = node.run_state[:helper_cache] ||= {}
      end
     
      # set
      def set(key, value)
        @cache[key] = value
      end

      # get 
      def get(key)
        @cache.has_key?( key ) ? @cache[key] : nil
      end

      # set only if key doesn't already have a value
      def set_if_empty(key, value)
        return false if get( key )
        set key, value 
        true
      end

    end
  end
end

