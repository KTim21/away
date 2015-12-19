class TripsController < ApplicationController
  skip_before_action :authorize, only: [:show]
  before_action :set_trip, only: [:show, :edit, :update, :destroy, :add_user, :remove_user]

  # GET /trips
  # GET /trips.json
  def index
    redirect_to current_user
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)
    current_user.trips << @trip
    respond_to do |format|
      if @trip.save
        current_user.save!
        format.html { redirect_to @trip }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def add_user
    user = User.find(params[:user])
    user.trips << @trip unless user.trips.include? @trip
    user.save!
    redirect_to current_user
  end
  
  def remove_user
    user = User.find(params[:user])
    if user.trips.delete(@trip)
      redirect_to current_user
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:description, :title, :image, :user)
    end
end
