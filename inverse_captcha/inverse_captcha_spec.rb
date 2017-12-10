require 'rspec'
require_relative 'inverse_captcha'

describe 'inverse captcha' do
  it 'should return 0 for an empty string' do
    expect(inverse_captcha('')).to be 0
  end

  it 'should return 1 for 112' do
    expect(inverse_captcha('112')).to be 1
  end

  it 'should return 2 for 223' do
    expect(inverse_captcha('223')).to be 2
  end

  it 'should return 4 for 22' do
    expect(inverse_captcha('22')).to be 4
  end

  it 'should return 6 for 1212' do
    expect(inverse_captcha('1212', 2)).to be 6
  end

  it 'should return 0 for 1221' do
    expect(inverse_captcha('1221', 2)).to be 0
  end

  it 'should return 4 for 123425' do
    expect(inverse_captcha('123425', 3)).to be 4
  end
end