class CorruptionChecksum
  def self.checksum(input)
    tokenized_input = input.split("\n")
    tokenized_input.map {|row| yield(row)}.sum
  end

  def self.min_max(input)
    tokenized_input = input.split(' ').map(&:to_i)
    tokenized_input.max - tokenized_input.min
  end

  def self.divide(input)
    tokenized_input = input.split(' ').map(&:to_i)

    tokenized_input.each_with_index { |val, index|
      tokenized_input.each_with_index { |divisor, divisor_index|
        next if index == divisor_index
        return val / divisor if (val % divisor).zero?
      }
    }

    0
  end
end