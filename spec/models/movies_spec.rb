require 'spec_helper'

describe Movie do
  describe 'searching movies by director' do
    
    it 'should receive a valid director' do
      Movie.should_receive(:find_by_director)
      Movie.find_by_director("Pepe")
    end
  end
end
