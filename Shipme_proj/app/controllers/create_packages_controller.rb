class CreatePackagesController < ApplicationController
  before_action :set_create_package, only: [:show, :edit, :update, :destroy]

  # GET /create_packages
  # GET /create_packages.json
  #This method finds all the packages.
  #The attributes of packages.
  #This method returns all the packages.
  #Author: Abdelrahman Y. Seoudy.
  
  def  index
    @c = Packages.find(:all)
  end

  # GET /create_packages/1
  # GET /create_packages/1.json
  def show
  end

  # GET /create_packages/new
  def new
    @create_package = CreatePackage.new
  end

  # GET /create_packages/1/edit
  def edit
  end

  # POST /create_packages
  # POST /create_packages.json
  def create
    @create_package = CreatePackage.new(create_package_params)

    respond_to do |format|
      if @create_package.save
        format.html { redirect_to @create_package, notice: 'Create package was successfully created.' }
        format.json { render action: 'show', status: :created, location: @create_package }
      else
        format.html { render action: 'new' }
        format.json { render json: @create_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /create_packages/1
  # PATCH/PUT /create_packages/1.json
  def update
    respond_to do |format|
      if @create_package.update(create_package_params)
        format.html { redirect_to @create_package, notice: 'Create package was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @create_package.errors, status: :unprocessable_entity }
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
      @create_package = CreatePackage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_package_params
      params.require(:create_package).permit(:destination, :description, :weight, :origin, :Expiry_Date, :value, :receiverAddress, :receivermobile, :receiverMail)
    end
end
