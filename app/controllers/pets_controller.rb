class PetsController < ApplicationController

  before_action :set_pet, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!
  before_action :check_auth



  def check_auth
    unless user_signed_in?
        redirect_to :controller => :page
    end
end

def index
  @pets = current_user.pets
end

def show
  @country = request.location.country
  @city = request.location.city
end

def new
  @pet = current_user.pets.build
end

def create
  @pet = current_user.pets.build(pet_params)
  if @pet.save
    redirect_to pets_path, notice: 'Pet created!'
  else
    render :new, status: :unprocessable_entity
  end
end

def edit
end

def update
  if @pet.update(pet_params)
    redirect_to pets_path, notice: "Pet updated!"
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @pet.destroy
  redirect_to pets_path, notice: "Pet deleted!"
end

private
  def set_pet
    @pet = current_user.pets.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, 
                                :breed, 
                                :specie, 
                                :birthdate, 
                                :age, 
                                :gender, 
                                :vaccinated, 
                                {images: []},
                                :remove_images,
                                :images_cache,
                                :remote_images_url,
                                :user_id)
  end
end