class PetsController < ApplicationController
  before_action :set_pet, only: %i[ edit show update destroy ]

  def index
    @pets = current_user.pets
  end

  def show
  end

  def new
    @pet = current_user.pets.build
  end

  def edit
  end

  def create
    @pet = current_user.pets.build(pet_params)
    respond_to do |format|
      if @pet.save
        format.html { redirect_to pets_path, notice: 'Pet created!' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to pets_path, notice: "Pet updated!" }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_path, notice: "Pet deleted!" }
      format.json { head :no_content }
    end
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
