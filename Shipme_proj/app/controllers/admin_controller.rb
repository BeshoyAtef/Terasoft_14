class AdminController < ApplicationController
  require 'will_paginate/array'

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end


  def list

    @packages = Packages.view_shipments_paginated( params[:page] )

  end

  def show
  end

  def delete
  end

  def destory
  end
end
