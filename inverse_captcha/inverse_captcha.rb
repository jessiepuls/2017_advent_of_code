def inverse_captcha(str)
  result = 0

  strval = str.split('').map(&:to_i)
  strval.each.with_index(1) { |value, index|
    result += value if value == strval[index]
  }

  result
end
