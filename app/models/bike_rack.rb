class BikeRack < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  def self.clearAllData
    BikeRack.all.each do |br|
      br.destroy
    end

  end


  def self.shortenLocation(string)
    string.partition(",").first
  end

  def self.parseLatLon(br)
    tempLat = br.latitude
    tempLon = br.longitude
    arr = [tempLat, tempLon]
    arr
  end

   
  def self.imgStr(arr)
    "https://maps.googleapis.com/maps/api/staticmap?center=" + arr.first.to_s + "," + arr.last.to_s + "&zoom=14&size=300x300&markers=" + arr.first.to_s + "," + arr.last.to_s + "&sensor=false"
  end


end
