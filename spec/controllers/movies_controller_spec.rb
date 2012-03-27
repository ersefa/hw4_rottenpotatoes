require 'spec_helper'

describe MoviesController do

  context '#same_director' do

    context 'with a movie with a director' do

      let(:movie) { stub_model Movie, :director => 'Martin Scorsese' }

      it 'should call the find method of the Movie model' do
        Movie.should_receive(:find).with("23").and_return(movie)
        get :directors, :id => 23
      end

      it 'should render the similar page' do
        Movie.stub(:find).and_return(movie)
        get :directors, :id => 23
        response.should render_template(:directors)
      end

    end

    context 'with a movie without a director' do

      let(:movie) { stub_model Movie, :director => nil }

      it 'should call the find method of the Movie model' do
        Movie.should_receive(:find).with("23").and_return(movie)
        get :directors, :id => 23
      end

      it 'should redirect to the home page' do
        Movie.should_receive(:find).with("23").and_return(movie)
        get :directors, :id => 23
        response.should redirect_to(movies_path)
      end

    end

  end

  context '#destroy' do

    let(:movie) { stub_model Movie, :id => 23 }

    it 'should call the destroy method of the Movie model' do
      Movie.should_receive(:find).with("23").and_return(movie)
      movie.should_receive(:destroy)
      delete :destroy, :id => 23
    end

    it 'should redirect to the home page' do
      Movie.stub(:find).and_return(movie)
      movie.stub(:destroy)
      delete :destroy, :id => 23
      response.should redirect_to(movies_path)
    end

  end

end
