class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
    def hash
      each_with_index.inject(0) do |intermediate_hash, (el, i)|
        (el.hash + i.hash) ^ intermediate_hash
      end
    end
end

class String
  def hash
    result = []
    self.each_char.with_index do |char, idx|
      result << (char.ord.hash * idx).hash
    end
    result.join.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
    result = 0
    self.map do |key, value|
      result += key.hash + value.hash
    end
    result
  end
end
