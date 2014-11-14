class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :redirect_invalid_profile, only:[:new]

  # GET /properties
  # GET /properties.json
  def index

  @properties = Property.all

  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @property = set_property
    @p = listings(@property.location.postcode.to_s)
    puts @p
    if (@p == 0 || @p["error_string"] == "Unknown location entered.")
      redirect_to properties_path, notice: 'No properties found'
      else
    @properties = @p["listing"]
    respond_to do |format|
    format.html
    format.json{ render :json => @properties }
       end       
    end
  end

  # GET /properties/new
  def new
    @property = Property.new
    location = @property.build_location
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = current_user.properties.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to properties_path, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to properties_path, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def listings(postcode)
    @postcode = postcode.downcase.tr(" ", "+")
    response = HTTParty.get("http://api.zoopla.co.uk/api/v1/property_listings.json?postcode=#{@postcode}&radius=10&listing_status=rent&api_key=xu9atf63rq2rcc9gmmuqunwh")
    HTTParty.get("http://api.zoopla.co.uk/api/v1/property_listings.json?postcode=C11+c11&radius=10&listing_status=rent&api_key=xu9atf63rq2rcc9gmmuqunwh")
    case response.code
      when 200
       return response.parsed_response
      when 404
       return response = 0
      when 500...600
        return response = 0
    end
    end

    def redirect_invalid_profile
    unless current_user.nil?
    redirect_to(new_user_profiles_path(current_user.id)) if invalid_profile?
    end
  end

  def invalid_profile?
    current_user.try(:profile).try(:firstname).nil?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def property_params
   params.require(:property).permit(:cost, :currentrent, :location_attributes => [:postcode])
  end
  
  
  
end
