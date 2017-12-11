require 'rspec'
require_relative 'spiral_memory'

describe 'spiral memory' do
  context 'steps_to_access_port' do
    it 'should return 1 for location 1' do
      expect(SpiralMemory.steps_to_access_port(1)).to be 0
    end
  end
end
