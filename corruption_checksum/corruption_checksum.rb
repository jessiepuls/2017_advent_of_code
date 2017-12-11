class CorruptionChecksum
  def checksum(input)
    tokenized_input = input.split("\n")
    tokenized_input.map { |row| row_val(row) }.sum
  end

  def row_val(input)
    tokenized_input = input.split(' ').map(&:to_i)
    tokenized_input.max - tokenized_input.min
  end
end