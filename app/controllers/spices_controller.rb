class SpicesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :spice_not_found_error

  def index
   spices = Spice.all
   render json: spices
  end

  def create
    spice = Spice.create(spice_params)
    render json: spice
  end

  def show
    spice = find_spice_by_id
    render json: spice  
  end

  def update
    spice = find_spice_by_id
    spice.update(spice_params)
    render json: spice
  end

  def destroy
    spice = find_spice_by_id
    spice.destroy
    head :no_content  
  end

  private

  # not_found is = to 404
  def spice_not_found_error
    render json: { error: "Spice not found!" }, status: :not_found
  end

  def find_spice_by_id
    Spice.find(params[:id])
  end

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end
    
end