require 'rails_helper'

RSpec.describe "properties/new", :type => :view do
  before(:each) do
    assign(:property, Property.new())
  end

  it "renders new property form" do
    render

    assert_select "form[action=?][method=?]", properties_path, "post" do
    end
  end
end
