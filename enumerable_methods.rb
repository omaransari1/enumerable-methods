module Enumerable

  def my_each

    for elem in self
      yield(elem)
    end

  end

  def my_each_with_index

    for x in 0...self.length
      yield(self[x], x)
    end

  end

  def my_select
    arr = []

    self.my_each do |elem|
      result = yield(elem)
      arr << elem if result == true
    end

    arr
  end

  def my_all?

    self.my_each do |elem|
      result = yield(elem)
      return false if result == false
    end
    true
  end

  def my_any?

    self.my_each do |elem|
      result = yield(elem)
      return true if result == true
    end
    false
  end

  def my_none?
    self.my_each do |elem|
      result = yield(elem)
      return false if result == true
    end
    true
  end

  def my_count
    count = 0

    self.my_each do |elem|
      count += 1
    end
    count
  end

  def my_map
    arr = []

    self.my_each do |elem|
      arr << yield(elem)
    end
    arr
  end

  # def my_map(&proc)
    # arr = []

    #   self.my_each do |elem|
    #     arr << proc.call(elem)
    #   end
    # arr

  # end

  def my_inject(value = nil)
    if value == nil
      value = self[0]
      self.my_each_with_index do |elem, i|
        next if i == 0
       value = yield(value, elem)
      end
      value
    else
      self.my_each do |elem|
        value = yield(value, elem)
      end
    value
    end
  end

end

def multiply_els(array)

  array.my_inject{|val,elem| val * elem}

end



[0,1,2,3].my_each{|x| puts x + 2}
[0,1,2,1].my_each_with_index {|x, i| puts "element: #{x}, index: #{i}"}
puts [0,1,2,3,4].my_select {|x| x > 2}

puts [0,1,2,3,4,5].all? {|x| x > 2}


puts "Count of [0,1,2,3]: #{[0,1,2,3].my_count}"

puts [0,1,2,3].my_map{|x| x + 1}

puts "Inject: #{[0,1,2,3,4].my_inject {|val, elem| val + elem}}"

puts multiply_els([2,4,5])

