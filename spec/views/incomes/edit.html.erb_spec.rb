require 'spec_helper'

describe "incomes/edit" do
  before(:each) do
    @income = assign(:income, stub_model(Income,
      :test => false,
      :description => "MyText",
      :value => 1.5,
      :student_id => 1
    ))
  end

  it "renders the edit income form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => incomes_path(@income), :method => "post" do
      assert_select "input#income_test", :name => "income[test]"
      assert_select "textarea#income_description", :name => "income[description]"
      assert_select "input#income_value", :name => "income[value]"
      assert_select "input#income_student_id", :name => "income[student_id]"
    end
  end
end
