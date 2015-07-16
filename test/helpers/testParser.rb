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


test "name change" do
    
   
  parseCSV(csvString)
  assert_instance_of( Array, csvArray, "not an Array!!!" )
  assert_equals(1, 2)
  end
  
  
end