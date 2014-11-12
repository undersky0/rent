require 'rails_helper'

RSpec.describe "properties/index", :type => :view do
  before(:each) do
    assign(:properties, [
      Property.create!(),
      Property.create!()
    ])
  end

  it "renders a list of properties" do
    render
  end
end
