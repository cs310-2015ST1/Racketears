require 'test_helper'
 
class WaterFountainsHelperTest < ActionView::TestCase

setup do
	WaterFountain.destroy_all
end


csv_sample = <<-eos
LATITUDE,LONGITUDE,NAME,MAINTAINER
49.234946999999998,-123.027254000000000,Fountain location:Aberdeen,Parks
49.275857999999999,-123.024141000000000,Fountain location:Adanac,Parks
49.285553999999998,-123.142392000000000,Fountain location:Alexandria,Parks
49.260980000000004,-123.184759000000000,Fountain location:Almond,Parks
eos

test "parser should work" do
assert_empty(WaterFountain.all, "Test database should be empty before testing parser!")
parse_wf_csv(csv_sample)
# Test that parser created four WF objects!
assert_equal(4,WaterFountain.count, "Wrong number of fountains created!")
sample_wf = WaterFountain.first 
assert_kind_of(WaterFountain, sample_wf)
assert_equal("Fountain location:Aberdeen", sample_wf.location)


end

end