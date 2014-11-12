require 'rails_helper'

RSpec.describe "profiles/new", :type => :view do
  before(:each) do
    assign(:profile, Profile.new(
      :firstname => "MyString",
      :lastname => "MyString",
      :phone => 1
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input#profile_firstname[name=?]", "profile[firstname]"

      assert_select "input#profile_lastname[name=?]", "profile[lastname]"

      assert_select "input#profile_phone[name=?]", "profile[phone]"
    end
  end
end
