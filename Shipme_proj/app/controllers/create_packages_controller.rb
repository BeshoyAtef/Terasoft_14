class CreatePackagesController < ApplicationController
  before_action :set_create_package, only: [:show, :edit, :update, :destroy]

  # GET /create_packages
  # GET /create_packages.json
  def index
    @create_packages = Packages.all
  end

  # GET /create_packages/1
  # GET /create_packages/1.json
  def show
  end

  # GET /create_packages/new
  def new
    @create_packages = Packages.new
  end

  # GET /create_packages/1/edit
  def edit
  end

  # POST /create_packages
  # POST /create_packages.json
  def create
    @create_packages = Packages.new(create_packages_params)

    respond_to do |format|
      if @create_packages.save
        format.html { redirect_to @create_packages, notice: 'Create package was successfully created.' }
        format.json { render action: 'show', status: :created, location: @create_packages }
      else
        format.html { render action: 'new' }
        format.json { render json: @create_packages.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /create_packages/1
  # PATCH/PUT /create_packages/1.json
  def update
    respond_to do |format|
      if @create_package.update(create_packages_params)
        format.html { redirect_to @creates_package, notice: 'Create package was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @create_packages.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /create_packages/1
  # DELETE /create_packages/1.json
  def destroy
    @create_package.destroy
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
    def create_package_params
      params.require(:create_packages).permit(:destination, :description, :weight, :origin, :Expiry_Date, :value, :receiverAddress, :receivermobile, :receiverMail)
    end
end
