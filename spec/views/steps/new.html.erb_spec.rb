require 'spec_helper'

describe "steps/new" do
  before(:each) do
    assign(:step, stub_model(Step,
      :step => 1,
      :complete => false,
      :controller => "MyString",
      :action => "MyString",
      :variable => "MyString"
    ).as_new_record)
  end

  it "renders new step form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => steps_path, :method => "post" do
      assert_select "input#step_step", :name => "step[step]"
      assert_select "input#step_complete", :name => "step[complete]"
      assert_select "input#step_controller", :name => "step[controller]"
      assert_select "input#step_action", :name => "step[action]"
      assert_select "input#step_variable", :name => "step[variable]"
    end
  end
end
