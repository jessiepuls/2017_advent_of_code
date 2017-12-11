require 'rspec'
require_relative 'corruption_checksum'

describe 'corruption checksum' do
  let(:corruption_checksum) { CorruptionChecksum.new }

  context 'row_val' do
    it 'should return the difference between the largest and smallest value' do
      expect(corruption_checksum.row_val('5 1 9 5')).to be 8
    end
  end
end
