class LegsController < ApplicationController
  skip_before_action :authorize, only: [:show]
  before_action :set_leg, only: [:show, :edit, :update, :destroy, :add_image]
  # GET /legs
  # GET /legs.json
  def index
    @legs = Leg.all
  end

  # GET /legs/1
  # GET /legs/1.json
  def show
    @photo = Photo.new
    @tracks = @trip.legs.map { |leg| leg.track }
    @tracks.delete_if { |track| !track.exists? }
  end

  # GET /legs/new
  def new
    @leg = Leg.new
    @trip = Trip.find(params[:trip])
  end

  # GET /legs/1/edit
  def edit
  end

  # POST /legs
  # POST /legs.json
  def create
    @trip = Trip.find(params[:trip])
    @leg = @trip.legs.build(leg_params)
    respond_to do |format|
      if @leg.save
        format.html { redirect_to @leg }
        format.json { render :show, status: :created, location: @leg }
      else
        format.html { render :new }
        format.json { render json: @leg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legs/1
  # PATCH/PUT /legs/1.json
  def update
    respond_to do |format|
      if @leg.update(leg_params)
        format.html { redirect_to @leg }
        format.json { render :show, status: :ok, location: @leg }
      else
        format.html { render :edit }
        format.json { render json: @leg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legs/1
  # DELETE /legs/1.json
  def destroy
    @leg.destroy
    respond_to do |format|
      format.html { redirect_to @trip, notice: 'Leg was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leg
      @leg = Leg.find(params[:id])
      @trip = @leg.trip
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leg_params
      params.require(:leg).permit(:description, :distance, :track, :trip, :date, :title, :maxkmh, :time, :hm)
    end
end
