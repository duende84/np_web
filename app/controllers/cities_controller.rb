class CitiesController < ApplicationController

	def index
		@cities = City.all
  	@json = @cities.to_a.to_gmaps4rails do |city, marker|
	  	marker.infowindow render_to_string(:partial => "/cities/infowindow", :locals => { :city => city})
	    marker.title "#{city.name}"
	    marker.json({ :name => city.name, :slogan => city.slogan })
  	end
  	respond_to do |format|
		    format.html
		    format.json { render json: @cities }
		end
	end
end