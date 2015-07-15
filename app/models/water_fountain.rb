require 'csv'

class WaterFountain < ActiveRecord::Base

  def self.clearAllData
    WaterFountain.all.each do |wf|
      wf.destroy
    end
  end

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
    "https://maps.googleapis.com/maps/api/staticmap?center=" + arr.first.to_s + "," + arr.last.to_s + "&zoom=14&size=800x800&markers=" + arr.first.to_s + "," + arr.last.to_s + "&sensor=false"
  end

    # Parse CSV file
  def parse_wf_csv(csv)
    csvArray = CSV.parse(csv)
    newArray = csvArray.drop(1)
    for i in newArray
    WaterFountain.create(location: i[2].force_encoding('iso-8859-1').encode('utf-8'), lat: i[0].to_f, lon: i[1].to_f)
    end
  end

end
