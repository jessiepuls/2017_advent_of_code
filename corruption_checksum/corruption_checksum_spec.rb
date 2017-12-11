require 'rspec'
require_relative 'corruption_checksum'

describe 'corruption checksum' do
  let(:corruption_checksum) { CorruptionChecksum.new }

  context 'row_val' do
    it 'should return 8 for an input of 5 1 9 5' do
      expect(corruption_checksum.row_val('5 1 9 5')).to be 8
    end

    it 'should return 4 for an input of 7 5 3' do
      expect(corruption_checksum.row_val('7 5 3')).to be 4
    end
  end
end
