class JourneysController < ApplicationController
  require 'exceptions'
  def index
    @journeys = Journey.all
    
  end

  def new
    @journey = Journey.new
  end

  def create
    
    @journey = Journey.create(journey_params)
    
    if@journey.save
      redirect_to journey_path(@journey)
      flash[:notice] = "Journey created successfully"
    else
      @errors = @journey.errors
      render 'new'
    end

    rescue Exceptions::ThirdPartyAPIError => e
      flash[:alert] = e.message
      @journey = Journey.new(journey_params)
      render 'new'
  end

  def show
    @journey = Journey.includes(:routes).find(params[:id])
  end

  private

  def journey_params
    params.require(:journey).permit(:leaving_date, :leaving_time, :name, 
      routes_attributes: [:id, :time_on_location, :_destroy, 
        init_location_attributes: [:id, :address, :_destroy],
        end_location_attributes: [:id, :address, :_destroy]])
  end
end
