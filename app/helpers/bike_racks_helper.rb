module BikeRacksHelper
    
    # 
    
    def parseCSV(s)
        #create 2D Array of String
      brArray = CSV.parse(s)
        #drop CSV header line
      arr = brArray.drop(1)
      createRacks(arr)
    end
    
     def createRacks(arr)
      for i in arr
      sleep(0.2)   # to slow down the loop
      address = i[0] + " " + i[1] + ", " + "Vancouver" + " BC"
      BikeRack.create(address: address, quantity: i[5])
    end
end


     # for development
    # (0...100).each do |i|
      # temp = arr[i]
      # BikeRack.create(address: temp[0] + " " + temp[1] + ", " + "Vancouver" + " BC", quantity: temp[5])
    # end

    
end
