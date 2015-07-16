module WaterFountainsHelper
# Parse CSV file
  def parse_wf_csv(csv)
    csvArray = CSV.parse(csv)
    newArray = csvArray.drop(1)
    for i in newArray
    WaterFountain.create(location: i[2].force_encoding('iso-8859-1').encode('utf-8'), lat: i[0].to_f, lon: i[1].to_f)
    end
  end
end
