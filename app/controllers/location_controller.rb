class LocationController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
  	@location = Location.all.order('Created_at DESC')
  end

  def new
    @location = Location.new
  end

  def edit
    @location = Location.find(location[:id])
  end

  def create
  	@location = current_user.Location.new(location_params)

  	@location.save
  		redirect_to @location
  end

  def show
  	@location = Location.find(location[:id])
  end

  def update
    @location = Location.find(location[:id])

    if @location.update(location_params)
      redirect_to @location
    else
      render 'edit'
    end
  end

  def destroy
    @location = Location.find(location[:id])
    @location.destroy
    
    redirect_to location_path
end
  
  
  private
  def location_params
    location.require(:location).permit(:name)
  end
end
