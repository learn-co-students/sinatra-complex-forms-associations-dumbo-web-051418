class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    # binding.pry
    @pet = Pet.create(params[:pet])

    # This is designed to effectively handle text information
    # and use the customly made setter
    if !params[:owner][:by_name].empty?
      @pet.owner = Owner.create(name: params[:owner][:by_name])
      @pet.save
    end

    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    @owners = Owner.all
    erb :'/pets/edit'
  end

  post '/pets/:id' do

    redirect to "pets/#{@pet.id}"
  end

  patch '/pets' do
    @pet = Pet.find(params[:pet_id])
    @pet.update(params[:pet])
    if !params[:owner][:name].empty?
      @pet.owner = Owner.create(name: params[:owner][:name])
      @pet.save
    end
  end

end
