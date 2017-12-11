class CorruptionChecksum
  def self.checksum(input)
    input.split("\n").map { |row| yield(row) }.sum
  end

  def self.min_max(row)
    row_values = tokenize_input(row)
    row_values.max - row_values.min
  end

  def self.divide(row)
    row_values = tokenize_input(row)

    row_values.each_with_index { |val, index|
      row_values.each_with_index { |divisor, divisor_index|
        next if index == divisor_index
        return val / divisor if (val % divisor).zero?
      }
    }

    0
  end

  def self.tokenize_input(input)
    input.split(' ').map(&:to_i)
  end
end