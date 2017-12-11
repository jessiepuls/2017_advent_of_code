class CorruptionChecksum
  def self.checksum(input)
    tokenized_input = input.split("\n")
    tokenized_input.map { |row| yield(row) }.sum
  end

  def self.min_max(input)
    tokenized_input = input.split(' ').map(&:to_i)
    tokenized_input.max - tokenized_input.min
  end

  def self.divide(input)
    4
  end
end