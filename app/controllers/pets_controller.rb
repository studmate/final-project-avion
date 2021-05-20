class PetsController < ApplicationController
  before_action :set_pet, only: %i[ show edit update destroy ]

  def index
    @pets = current_user.pets
  end

  def show
  end

  def new
    @pet = current_user.pets.build
  end

  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      redirect_to pets_path, notice: "Pet created!"
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
