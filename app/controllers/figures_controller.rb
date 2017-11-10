class FiguresController < ApplicationController

#CREATE
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params[:title][:name].empty? #add title associated w/ figure if exists
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?  #add landmark associated w/ figure if exists
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

#READ
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

#UPDATE
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark]) #add landmark associated w/ figure if exists
    end

    if !params[:title][:name].empty? #add title associated w/ figure if exists
      @figure.titles << Title.create(params[:title])
    end

    @figure.save

    redirect to "/figures/#{@figure.id}"
  end

end
