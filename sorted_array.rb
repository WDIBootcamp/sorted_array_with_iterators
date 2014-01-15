class SortedArray
  attr_reader :internal_arr

  def initialize arr=[]
    @internal_arr = []
    arr.each { |el| add el }
  end

  def add el
    # we are going to keep this array
    # sorted at all times. so this is ez
    lo = 0
    hi = @internal_arr.size
    # note that when the array just
    # starts out, it's zero size, so
    # we don't do anything in the while
    # otherwise this loop determines
    # the position in the array, *before*
    # which to insert our element
    while lo < hi
      # let's get the midpoint
      mid = (lo + hi) / 2
      if @internal_arr[mid] < el
        # if the middle element is less 
        # than the current element
        # let's increment the lo by one
        # from the current midway point
        lo = mid + 1
      else
        # otherwise the hi *is* the midway 
        # point, we'll take the left side next
        hi = mid 
      end
    end

    # insert at the lo position
    @internal_arr.insert(lo, el)
  end

  def each &block
    i = 0
    while i < @internal_arr.size
      yield @internal_arr[i]
      i += 1
    end
    @internal_arr
  end

  def map &block
     # i = 0
     new_arr = []

    # OR use each instead
    each { |element| new_arr << (yield element) }

    # while i < @internal_arr.size
    #   new_arr << (yield @internal_arr[i])
    #   i += 1
    # end
    new_arr
  end

  def map! &block
     new_arr = []

     each { |element| new_arr << (yield element) }

    @internal_arr = new_arr
 
  end

  def find &block
    #block should return true when you find the element you are looking for
    i = 0

    # each do |element| 
    #   if (yield element) == true
    #     return element
    #   end
    # return nil
    # end

    while i < @internal_arr.size
      if (yield @internal_arr[i]) == true
        return @internal_arr[i]
      end
      i += 1
    end
    return nil

  end

  def inject acc=0, &block
    
    each { |element| acc << (yield element) }

  end

  def each_with_index
    # and then implement all the other blocks with this method
    #calls block with two arguments, the item and its index
    # returns a hash
  end
end
