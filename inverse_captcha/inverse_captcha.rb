def inverse_captcha(str, offset = 1)
  result = 0

  strval = str.split('').map(&:to_i)
  strval.each.with_index(offset) { |value, index|
    index -= strval.length if index >= strval.length
    result += value if value == strval[index]
  }

  result
end
