class JourneysController < ApplicationController
  
  def index
    @journeys = Journey.all
    
  end

  def new
    @journey = Journey.new
  end

  def create
    @journey = Journey.create(journey_params)
    if(@journey.save)
      redirect_to journeys_path
    else
      @errors = @journey.errors
      render 'new'
    end
  end

  def show
    @journey = Journey.includes(:routes).find(params[:id])
  end

  private

  def journey_params
    params.require(:journey).permit(:leaving_date, :leaving_time, :name, 
      :routes_attributes => [:id, :time_on_location, :_destroy, :init_location ,:end_location ])
  end
end
