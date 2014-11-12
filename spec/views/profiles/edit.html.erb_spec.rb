require 'rails_helper'

RSpec.describe "profiles/edit", :type => :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :firstname => "MyString",
      :lastname => "MyString",
      :phone => 1
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input#profile_firstname[name=?]", "profile[firstname]"

      assert_select "input#profile_lastname[name=?]", "profile[lastname]"

      assert_select "input#profile_phone[name=?]", "profile[phone]"
    end
  end
end
