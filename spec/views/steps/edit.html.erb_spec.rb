require 'spec_helper'

describe "steps/edit" do
  before(:each) do
    @step = assign(:step, stub_model(Step,
      :step => 1,
      :complete => false,
      :controller => "MyString",
      :action => "MyString",
      :variable => "MyString"
    ))
  end

  it "renders the edit step form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => steps_path(@step), :method => "post" do
      assert_select "input#step_step", :name => "step[step]"
      assert_select "input#step_complete", :name => "step[complete]"
      assert_select "input#step_controller", :name => "step[controller]"
      assert_select "input#step_action", :name => "step[action]"
      assert_select "input#step_variable", :name => "step[variable]"
    end
  end
end
