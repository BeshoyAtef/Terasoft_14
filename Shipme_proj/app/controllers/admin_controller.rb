class AdminController < ApplicationController
  
  require 'rubygems'
  require 'googlecharts'
  require 'gchart'

  def index
    render layout: false
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
    @package_count = Packages.generate_shipments_graph
    render layout: false
  end
    #Gchart.pie(:title => 'Shipments', :size => '400x200',:data => [10, 45, 45], :labels => ["April", "May", "June"] )
  
    #@gchart =Packages.pie_chart_for_shipments
    #Packages.chart_data(params [:chart_data])
  

  def delete
  end

  def destory
  end
end
