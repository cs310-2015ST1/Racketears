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
    49.260980000000010,-123.184759000000000,Fountain location:POOP,Parks
    eos

  test "test csv parser" do
    parse_wf_csv(csv_sample)
    assert_equal(4,WaterFountain.count)
  end


end