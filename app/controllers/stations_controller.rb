class StationsController < ApplicationController
  before_action :set_station, only: [:edit, :update, :destroy]
  # before_action :station_logged_in?, only: [:edit, :update, :destroy]

  # GET /stations/new
  def new
    @station = Station.new
  end

  # GET /stations/1/edit
  def edit
  end

  # POST /stations
  # POST /stations.json
  def create
    count = 1
    @station = Station.new(station_params)
    respond_to do |format|
      if @station.save
        10.times do
          Ranking.create(rank: count, artist_id: "", station_id: @station.id)
          count += 1
        end
        session[:user_id] = @station.id
        session[:user_type] = "stations"
        session[:user_name] = @station.name
        format.html { redirect_to root_url, notice: 'Station was successfully created.' }
        format.json { render :show, status: :created, location: @station }
      else
        format.html { render :new }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to root_url, notice: 'Station was successfully updated.' }
        format.json { render :show, status: :ok, location: @station }
      else
        format.html { render :edit }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      params.require(:station).permit(:name, :email, :password, :station_name, :picture_upload,
        :phone_number, :address_1, :address_2, :city, :state, :zipcode, promoter_ids: [])
    end
end
