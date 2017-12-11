class CorruptionChecksum
  def row_val(input)
    tokenized_input = input.split(' ').map(&:to_i)
    tokenized_input.max - tokenized_input.min
  end
end