require 'spec_helper'

describe "students/index" do
  before(:each) do
    assign(:students, [
      stub_model(Student,
        :name => "Name",
        :email => "Email",
        :address => "MyText",
        :home_phone => "Home Phone",
        :mobile => "Mobile",
        :user_id => 1,
        :current => false,
        :passed => false
      ),
      stub_model(Student,
        :name => "Name",
        :email => "Email",
        :address => "MyText",
        :home_phone => "Home Phone",
        :mobile => "Mobile",
        :user_id => 1,
        :current => false,
        :passed => false
      )
    ])
  end

  it "renders a list of students" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Home Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
