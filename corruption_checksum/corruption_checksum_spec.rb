require 'rspec'
require_relative 'corruption_checksum'

describe 'corruption checksum' do
  let(:min_max) { CorruptionChecksum.method(:min_max) }

  context 'min_max' do
    it 'should return 8 for an input of 5 1 9 5' do
      expect(CorruptionChecksum.min_max('5 1 9 5')).to be 8
    end

    it 'should return 4 for an input of 7 5 3' do
      expect(CorruptionChecksum.min_max('7 5 3')).to be 4
    end

    it 'should return 6 for an input of 2 4 6 8' do
      expect(CorruptionChecksum.min_max('2 4 6 8')).to be 6
    end
  end

  context 'checksum' do
    it 'should return 18 for "5 1 9 5\n7 5 3\n2 4 6 8"' do
      input = "5 1 9 5\n7 5 3\n2 4 6 8"
      expect(CorruptionChecksum.checksum(input, &min_max)).to be 18
    end

    it 'should return 20 for "5 1 9 5\n7 5 2\n1 4 6 8"' do
      input = "5 1 9 5\n7 5 2\n1 4 6 8"
      expect(CorruptionChecksum.checksum(input, &min_max)).to be 20
    end
  end
end
