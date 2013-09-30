require 'spec_helper'

describe "students/show" do
  before(:each) do
    @student = assign(:student, stub_model(Student,
      :name => "Name",
      :email => "Email",
      :address => "MyText",
      :home_phone => "Home Phone",
      :mobile => "Mobile",
      :user_id => 1,
      :current => false,
      :passed => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/MyText/)
    rendered.should match(/Home Phone/)
    rendered.should match(/Mobile/)
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
