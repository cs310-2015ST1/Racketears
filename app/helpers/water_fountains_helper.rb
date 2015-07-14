module WaterFountainsHelper
	def addToFavorites
		@water_fountain = WaterFountain.find_by(id: 1)
		return "cat"
	end



end
