require 'rspec'
require_relative 'inverse_captcha'

describe 'inverse captcha' do
  it 'should return 0 for an empty string' do
    expect(inverse_captcha('')).to be 0
  end
end