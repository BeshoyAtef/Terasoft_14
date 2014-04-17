class PackageViewController < ApplicationController
  def PackgeViewer
  end
  
   attr_reader :Package_Id
		def PackageView(Package_Id)
				@Package.Id = Package_Id
		end
		end
