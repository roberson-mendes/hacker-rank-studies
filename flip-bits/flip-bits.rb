################################################---VERSION_1
def flippingBits(n)
  #create an array to hold the binary representation
  binary_representation = []
  31.downto(0) { |i| binary_representation.push(n[i]) }

  #flip bits
  binary_representation.map! do |item|
    item == 0 ? 1 : 0
  end

  #convert binary representation to int
  binary_representation.join.to_i(2)
end


################################################---VERSION_1.1

def flippingBits(n)
  #create an array to hold the binary representation
  binary_representation = []
  31.downto(0) { |i| binary_representation.push(n[i]) }

  flipped_binary = binary_representation.map do |item|
    item == 0 ? 1 : 0
  end

  to_10_base = -> (binary_array) { binary_array.join.to_i(2) }
  to_10_base.call(flipped_binary)
end

flippingBits(9)

################################################---VERSION_2
def flip_bits(binary_representation)
  binary_representation.map do |item|
      item == 0 ? 1 : 0
  end
end

def create_binary_representation(n)
  #create the binary representation of number in binary_representation array
  convert_to_binary_32 = -> do
      binary_representation = []
      31.downto(0) { |i| binary_representation.push(n[i]) }

      binary_representation
  end

  convert_to_binary_32.call()
end

def flippingBits(n)
  binary_representation = create_binary_representation(n)

  flipped_binary = flip_bits(binary_representation)

  convert_to_10_base = -> { flipped_binary.join.to_i(2) }

  convert_to_10_base.call()
end

flippingBits(9)

################################################---VERSION_3

class Binary
  #create the binary representation of number in binary_representation array
  def self.create_binary_representation(n)
      @binary_representation = []

      31.downto(0) { |i| @binary_representation.push(n[i]) }

      self
  end

  def self.flip_bits
      @binary_representation.map! do |item|
          item == 0 ? 1 : 0
      end

      self
  end

  def self.to_10_base
      @binary_representation.join.to_i(2)
  end
end

def flippingBits(n)
  Binary.create_binary_representation(n).flip_bits.to_10_base
end
