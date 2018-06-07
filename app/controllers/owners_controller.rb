class OwnersController < ApplicationController

  get '/owners' do
    @owners = Owner.all
    erb :'/owners/index'
  end

  get '/owners/new' do
    @pets = Pet.all
    erb :'/owners/new'
  end

  post '/owners' do
    @owner = Owner.create(params[:owner])
    if !params[:pet][:name].empty?
      @owner.pets << Pet.create(name: params[:pet][:name])
    end
    redirect "/owners/#{@owner.id}"
  end

  patch '/owners' do
    # This includes name and also the checkmarked data
    # checkmarked data contains the id numbers in the arrays
    @owner = Owner.find(params[:owner_id])
    @owner.update(params[:owner])
    if !params[:pet][:name].empty?
      @owner.pets << Pet.create(name: params[:pet][:name])
    end
  end

  get '/owners/:id/edit' do
    @owner = Owner.find(params[:id])
    @pets = Pet.all
    erb :'/owners/edit'
  end

  get '/owners/:id' do
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end

  post '/owners/:id' do

  end
end
