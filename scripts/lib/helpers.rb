CONCURRENCY = 24

def process_in_queue(items, &block)
  queue = Queue.new
  items.each { queue.push(_1) }
  queue.close

  threads = CONCURRENCY.times.map do
    Thread.new do
      while item = queue.pop
        block.call(item)
      end
    end
  end

  threads.each(&:join)
end

# extension to string
class String
  def camelize(separator: '_')
    gsub(/#{separator}([a-z0-9])/) { Regexp.last_match(1).upcase }
  end
end
