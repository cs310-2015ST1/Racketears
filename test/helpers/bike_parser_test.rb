require 'test_helper'
 
class BikeRacksHelperTest < ActionView::TestCase


setup do
    BikeRack.destroy_all
end


 csvString = "134,Abbott St,East,,GT,1,2012
216,Abbott St,East,,GT,2,2012
455,Abbott St,West,,HC,4,2014
516,Abbott St,East,,HC,1,2014
568,Abbott St,East,,HC,1,2014
603,Abbott St,West,,HC,1,2014
623,Abbott St,West,,HC,1,2014
628,Abbott St,East,,HC,1,2014
660,Abbott St,East,,HC,1,2014
683,Abbott St,West,,HC,1,2014"



test "CSV string to 2D array of string" do
    
  assert_empty(BikeRack.all, "Test database should be empty before testing parser!") 
  csvArray = parseCSV(csvString)
  assert_instance_of( Array, csvArray, "Should be an Array" )
  assert_equal(9, BikeRack.count, "Should be an array with 9 elements")
  assert_equal("216", csvArray.first.first, "Should be the first item of first item in 2d array")
  assert_equal("2014", csvArray.last.last, "Should be the last item of last item in 2d array")
  assert_not_equal("134", csvArray.first.first, "The first element in the array should have been dropped")
  
  end
  
  
  csvArray = [["134","Abbott St","East","","GT","1","2012"],
              ["216","Abbott St","East","","GT","2","2012"],
              ["455","Abbott St","West","","HC","4","2014"]]
  
  test "database should be populated with bike rack objects" do
  
  assert_instance_of(Array, csvArray, "Should be an array")
  assert_empty(BikeRack.all, "Test database should be empty before testing parser!")
  createRacks(csvArray)
  assert_not_empty(BikeRack.all, "Should not be empty")
  sample_br = BikeRack.first 
  assert_kind_of(BikeRack, sample_br, "Should be a BikeRack")
  assert_equal(3, BikeRack.all.size, "Should be three bikeracks")
  
  assert_equal("134 Abbott St, Vancouver BC", sample_br.address)
  assert_equal(1, sample_br.quantity)
  assert_equal(4, BikeRack.all.third.quantity)
  
  end
  
end