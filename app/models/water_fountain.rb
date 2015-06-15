class WaterFountain < ActiveRecord::Base


  def self.shortenLocation(string)
    string.partition(":").last
  end

  def self.parseLatLon(wf)
    tempLat = wf.lat
    tempLon = wf.lon
    arr = [tempLat, tempLon]
    arr
  end


  def self.imgStr(arr)
    "https://maps.googleapis.com/maps/api/staticmap?center=" + arr.first.to_s + "," + arr.last.to_s + "&zoom=14&size=300x300&markers=" + arr.first.to_s + "," + arr.last.to_s + "&sensor=false"
  end


end
