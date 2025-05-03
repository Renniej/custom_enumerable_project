require "pry-byebug"
module Enumerable
  def my_select(&filterFunc) 
    filtered_arr = []
    self.my_each do |value|
      filtered_arr.push(value) if (filterFunc.call(value))
    end

    filtered_arr
  end

  def my_map(&func) 
    arr = []
    self.my_each do |value|
      arr.push(func.call(value)) 
    end

    arr
  end

  def my_each_with_index(&func)
    return self if func.nil?
    index = 0

    self.my_each do |value|
      func.call(value, index)
      index += 1
    end
    self
  end


  def my_all?(&condition)

    self.my_each do | value |
      return false if !condition.call(value)
    end
    true
  end


  def my_any?(&condition)
    self.my_each do |value|
      return true if condition.call(value)
    end
    false
  end


  def my_none?(&condition)
    self.my_each do |value|
      return false if condition.call(value)
    end
    true
  end


  def my_count(&condition)
    return self.length if condition.nil?
    count = 0
    self.my_each do |value|
      count += 1 if condition.call(value)
    end
    count
  end


  def my_inject(accum, &condition)
    return self if condition.nil?
    accum = (accum.nil?) ? self.first() : accum

    self.my_each do |value|
      accum = condition.call(accum,value)
    end
    accum
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    return self if block.nil? 
    for elem in self 
      block.call(elem)
    end
  end
end
