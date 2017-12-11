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

    it 'should return 6 for an input of 2 4 6 8' do
      expect(corruption_checksum.row_val('2 4 6 8')).to be 6
    end
  end

  context 'checksum' do
    it 'should return a sum of each row val' do
      input = "5 1 9 5\n7 5 3\n2 4 6 8"
      expect(corruption_checksum.checksum(input)).to be 18
    end

    it 'should return a sum of each row val' do
      input = "5 1 9 5\n7 5 2\n1 4 6 8"
      expect(corruption_checksum.checksum(input)).to be 20
    end
  end
end
