require 'spec_helper'

describe MoviesController do

  context '#same_director' do

    context 'with a movie with a director' do

      let(:movie) { stub_model Movie, :director => 'Martin Scorsese' }

      it 'should call the find method of the Movie model' do
        Movie.should_receive(:find).with("23").and_return(movie)
        get :directors, :id => 23
      end

      it 'should render the directors page' do
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
  
  context '#update' do
    
    let(:movie) { stub_model Movie, :id => 23 }
      
    it 'should call the update method of the Movie model' do
      Movie.should_receive(:find).with("23").and_return(movie)
      movie.should_receive(:update)
      put :update, :id => 23
    end
  
  end
  
  context '#new' do
    it 'should render the new page' do
      get :new
      response.should render_template(:new)
    end
  end
  
  context '#show' do
    
    let(:movie) { stub_model Movie, :id => 23 }
      
    it 'should call the show method of the Movie model' do
      Movie.should_receive(:find).with("23").and_return(movie)
      get :show, :id => 23
    end
  
  end
  
  context '#index' do
    
    let(:movie) { stub_model Movie, :id => 23 }
      
    it 'should call the index method of the Movie model' do
      Movie.should_receive(:all_ratings)
      get :index
    end
  
  end
  
  context '#create' do
    
    let(:movie) { stub_model Movie, :id => 23 }
    
    it 'should redirect to the home page' do
      Movie.stub(:create).and_return(movie)
      post :create
      response.should redirect_to(movies_path)
    end
  
  end

end
