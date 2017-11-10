class LandmarksController < ApplicationController

  #CREATE
    get '/landmarks/new' do

      erb :'landmarks/new'
    end

    post '/landmarks' do
      @landmark = Landmark.create(params[:landmark])

      redirect to "/landmarks/#{@landmark.id}"
    end

  #READ
    get '/landmarks' do
      @landmarks = Landmark.all

      erb :'/landmarks/index'
    end

    get '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      erb :'landmarks/show'
    end

    #UPDATE
    get '/landmarks/:id/edit' do
      @landmark = Landmark.find(params[:id])

      erb :'/landmarks/edit'
    end

    post '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      @landmark.update(params[:landmark])
      @landmark.save

      redirect to "/landmarks/#{@landmark.id}"
      end

end
