class Stack
    def initialize
      # create ivar to store stack here!
      @stack_arr = []
    end

    def push(el)
      # adds an element to the stack
      @stack_arr << (el)
      el
    end

    def pop
      # removes one element from the stack
      @stack_arr.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @stack_arr.last
    end

    private

    attr_reader :stack_arr
  end

class Queue
  def initialize
    @queue_arr = []
  end

  def enqueue(el)
    @queue_arr.push(el)
    el
  end

  def dequeue
    @queue_arr.unshift
  end

  def peek
    @queue_arr.first
  end

  private

  attr_reader :queue_arr
end

class Map
  def initialize
    @map_arr = []
  end
  #either create a new key-value pair or update the value for a pre-existing key.

  def set(key, value)
    pair_idx = @map_arr.index { |pair| pair[0] == key }

    if pair_idx
      @map_arr[pair_idx][1] = value
    else
      @map_arr << [key, value]
    end

    value
  end

  def get(key)
    @map_arr.each_with_index do |k, idx|
      return @map_arr[idx][1] if @map_arr[idx][0] == key
    end

    nil #return nil if there is no such key
  end

  def delete(key)
    @map_arr.reject! { |pair| pair[0] == key }
    get(key) #return value
  end

  def show
    puts @map_arr.to_s
  end

  private

  attr_reader :
end
