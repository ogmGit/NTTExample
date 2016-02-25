class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.where(:project_id => params[:id]).first
	@county = County.where(:state_id => @location.state_id)
    if !@location == [] # empty array
	sadfalj
		respond_to do |format|
		  format.html # show.html.erb
		  format.json { render json: @location }
		end
	end
  end

  # GET /locations/1
  # GET /locations/1.json
  def shows
    @location = Location.find(params[:id])
	respond_to do |format|
		format.html # show.html.erb
		format.json { render json: @location }
	end
  end

  def send_to_mapping_site
    @location = Location.where(:project_id => params[:id]).first
	@county = County.find(@location.county_id)
    render :send_to_mapping_site, :layout => false
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def location_params
      params.require(:location).permit(:county_id, :project_id, :state_id, :status)
    end
end