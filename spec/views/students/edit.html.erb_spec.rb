require 'spec_helper'

describe "students/edit" do
  before(:each) do
    @student = assign(:student, stub_model(Student,
      :name => "MyString",
      :email => "MyString",
      :address => "MyText",
      :home_phone => "MyString",
      :mobile => "MyString",
      :user_id => 1,
      :current => false,
      :passed => false
    ))
  end

  it "renders the edit student form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => students_path(@student), :method => "post" do
      assert_select "input#student_name", :name => "student[name]"
      assert_select "input#student_email", :name => "student[email]"
      assert_select "textarea#student_address", :name => "student[address]"
      assert_select "input#student_home_phone", :name => "student[home_phone]"
      assert_select "input#student_mobile", :name => "student[mobile]"
      assert_select "input#student_user_id", :name => "student[user_id]"
      assert_select "input#student_current", :name => "student[current]"
      assert_select "input#student_passed", :name => "student[passed]"
    end
  end
end
