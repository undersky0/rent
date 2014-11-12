require 'rails_helper'

RSpec.describe "locations/show", :type => :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :address => "Address",
      :google_address => "Google Address",
      :postcode => "Postcode",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Google Address/)
    expect(rendered).to match(/Postcode/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
