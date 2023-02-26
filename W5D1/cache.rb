class LRUCache
    def initialize(length)
        @max_length = length
        @cache = []
    end

    def count
      # returns number of elements currently in cache
      return @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @cache.length < @max_length
        @cache << el
      else
        if @cache.include?(el)
            @cache.delete(el)
            @cache << el
        else
            @cache.shift
            @cache << el
        end
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      p @cache
    end

    private
    # helper methods go here!

  end

  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})

  p johnny_cache.show