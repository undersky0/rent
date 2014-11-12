require 'rails_helper'

RSpec.describe "properties/show", :type => :view do
  before(:each) do
    @property = assign(:property, Property.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
