class CreatePackagesController < ApplicationController
  before_action :set_create_package, only: [:show, :edit, :update, :destroy]

  # GET /create_packages
  # GET /create_packages.json
  def index
    @packages = Packages.all
  end

  # GET /create_packages/1
  # GET /create_packages/1.json
  def show
  end

  # GET /create_packages/new
  def new
    @package = Packages.new
  end

  # GET /create_packages/1/edit
  def edit
  end

  # POST /create_packages
  # POST /create_packages.json
  def create
    @package = Packages.new(Packages_params)

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: 'Create package was successfully created.' }
        format.json { render action: 'show', status: :created, location: @packages }
      else
        format.html { render action: 'new' }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /create_packages/1
  # PATCH/PUT /create_packages/1.json
  def update
    respond_to do |format|
      if @package.update(Packages_params)
        format.html { redirect_to @package, notice: 'Create package was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /create_packages/1
  # DELETE /create_packages/1.json
  def destroy
    @cackage.destroy
    respond_to do |format|
      format.html { redirect_to create_packages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_create_package
      @create_packages = Packages.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Packages_params
      params.require(:Packages).permit(:destination, :description, :weight, :origin, :expiryDate, :receiverAddress, :receiverMobNumber, :receiverEmail)
    end
end
