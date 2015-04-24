require 'spec_helper'

describe Parsenip do
  subject { Parsenip.new }

  describe '#parse' do
    let(:input) { "http://cooking.nytimes.com/recipes/1016841-rigatoni-and-cauliflower-al-forno" }
    let(:output) { subject.process(input) }

    it 'outputs a hash or recipe components' do
      # TODO: recipe hash method
    end

    it 'provides specific parts when asked' do
      # TODO: individual component methods
    end

  end
end