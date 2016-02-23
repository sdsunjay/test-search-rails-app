class LocationsController < ApplicationController
def new
    @page_title = 'Add New Location'
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)

    # Save the location
    if @location.save
      flash[:notice] = "Location Created"
      redirect_to locations_path
    else
      flash[:alert] = "Location Not Created"
      render 'new'
    end
  end
  def location_params
    params.require(:location).permit(:name, :state, :zip)
  end
 
end
