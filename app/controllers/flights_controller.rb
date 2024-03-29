class FlightsController < ApplicationController

  def index
    @flights = []
    if params[:search]
      @flights = Flight.where(start_airport_id: params[:search][:from_airport_id],
                              finish_airport_id: params[:search][:to_airport_id],
                              date: DateTime.parse(params[:search][:date]))
      flash.now[:danger] = 'The flight you requested could not be found' if @flights.empty?
    end

    respond_to do |format|
      format.html
      format.xml { render :xml => @flights }
      format.json { render :json => @flights }
    end
  end
end
