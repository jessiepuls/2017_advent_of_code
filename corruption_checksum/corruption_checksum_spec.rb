require 'rspec'
require_relative 'corruption_checksum'

describe 'corruption checksum' do
  let(:min_max) { CorruptionChecksum.method(:min_max) }
  let(:divide) { CorruptionChecksum.method(:divide) }

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

  context 'divide' do
    it 'should return 4 for an input of 5 9 2 8' do
      expect(CorruptionChecksum.divide('5 9 2 8')).to be 4
    end

    it 'should return 3 for an input of 9 4 7 3' do
      expect(CorruptionChecksum.divide('9 4 7 3')).to be 3
    end
  end

  context 'checksum' do
    it 'should return 18 for "5 1 9 5\n7 5 3\n2 4 6 8" using min_max' do
      input = "5 1 9 5\n7 5 3\n2 4 6 8"
      expect(CorruptionChecksum.checksum(input, &min_max)).to be 18
    end

    it 'should return 20 for "5 1 9 5\n7 5 2\n1 4 6 8" using min_max' do
      input = "5 1 9 5\n7 5 2\n1 4 6 8"
      expect(CorruptionChecksum.checksum(input, &min_max)).to be 20
    end

    it 'should return 9 for "5 9 2 8\n9 4 7 3\n3 8 6 5" using divide' do
      input = "5 9 2 8\n9 4 7 3\n3 8 6 5"
      expect(CorruptionChecksum.checksum(input, &divide)).to be 9
    end
  end
end
