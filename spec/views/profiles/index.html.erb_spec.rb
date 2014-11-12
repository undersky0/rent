require 'rails_helper'

RSpec.describe "profiles/index", :type => :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :phone => 1
      ),
      Profile.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :phone => 1
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
