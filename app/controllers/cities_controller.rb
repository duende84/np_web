class CitiesController < ApplicationController

	def index
		@json = City.all.to_a.to_gmaps4rails
		# @cities = City.all
    #	@json = @markets.to_gmaps4rails
	end
end
