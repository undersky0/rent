require 'rails_helper'

RSpec.describe "locations/new", :type => :view do
  before(:each) do
    assign(:location, Location.new(
      :address => "MyString",
      :google_address => "MyString",
      :postcode => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input#location_address[name=?]", "location[address]"

      assert_select "input#location_google_address[name=?]", "location[google_address]"

      assert_select "input#location_postcode[name=?]", "location[postcode]"

      assert_select "input#location_latitude[name=?]", "location[latitude]"

      assert_select "input#location_longitude[name=?]", "location[longitude]"
    end
  end
end
