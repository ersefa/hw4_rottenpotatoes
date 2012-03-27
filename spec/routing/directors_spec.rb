require 'spec_helper'

describe 'Route for Movies with the Same Director' do
  it 'routes /movies/directors/23 to the same_director action' do
    { :get => '/movies/directors/23' }.
      should route_to(:controller => 'movies', :action => 'directors', :id => '23')
  end

  it 'routes the same_director_movie_path named route to the same_director action' do
    { :get => directors_path(23) }.
      should route_to(:controller => 'movies', :action => 'directors', :id => '23')
  end
end
