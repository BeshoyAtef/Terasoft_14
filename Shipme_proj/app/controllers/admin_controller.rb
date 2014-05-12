class AdminController < ApplicationController
  
  require 'rubygems'
  require 'googlecharts'
  require 'gchart'

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
  end

  def show
    #packages.self.generate_shipments_graph
    Gchart.pie(:title => 'Shipments', :size => '400x200',
              :data => [10, 45, 45], :labels => ["April", "May", "June"] )
  end

  def delete
  end

  def destory
  end
end
