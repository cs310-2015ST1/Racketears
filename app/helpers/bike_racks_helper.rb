module BikeRacksHelper
    
    
    def parseCSV(s)
      brArray = CSV.parse(s)
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

    
end
