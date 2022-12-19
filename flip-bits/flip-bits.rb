#
# Complete the 'flippingBits' function below.
#


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


######################################################################---REFACTOR 1

def flippingBits_1(n)
  #create an array to hold the binary representation
  binary_representation = []
  31.downto(0) { |i| binary_representation.push(n[i]) }

  flipped_binary = binary_representation.map do |item|
    item == 0 ? 1 : 0
  end

  to_10_base = -> (binary_array) { binary_array.join.to_i(2) }
  to_10_base.call(flipped_binary)
end

######################################################################---REFACTOR 2
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

def flippingBits_2(n)
  binary_representation = create_binary_representation(n)

  flipped_binary = flip_bits(binary_representation)

  convert_to_10_base = -> { flipped_binary.join.to_i(2) }

  convert_to_10_base.call()
end

######################################################################---REFACTOR 3

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

def flippingBits_3(n)
  Binary.create_binary_representation(n).flip_bits.to_10_base
end

######################################################################---REFACTOR 4

class Binary4
  #create the binary representation of number in binary_representation array
  def self.create_binary_representation(n)
      @binary_representation = n.to_s(2)

      while(@binary_representation.size != 32)
        @binary_representation.prepend("0")
      end

      self
  end

  def self.flip_bits
      switch_0_and_1 = -> do
        start_string = 0
        end_string = @binary_representation.size-1
        for i in start_string..end_string
          chars = @binary_representation
          chars[i] = chars[i] == "0" ? "1" : "0"
        end
      end

      switch_0_and_1.call()

      self
  end

  def self.to_10_base
      @binary_representation.to_i(2)
  end
end

def flippingBits_4(n)
  Binary4.create_binary_representation(n).flip_bits.to_10_base
end

def test_flipping_bits_4
  puts flippingBits_4(9)
end

test_flipping_bits_4

######################################################################---SOLUTION 2
#instead of do it by brutal force, this solution applies existing ruby functions

def flippingBits_5(n)
  n.to_s(2).rjust(32, "0").gsub("0", "x").gsub("1", "0").gsub("x", "1").to_i(2)
end
