require 'spec_helper'

describe "steps/show" do
  before(:each) do
    @step = assign(:step, stub_model(Step,
      :step => 1,
      :complete => false,
      :controller => "Controller",
      :action => "Action",
      :variable => "Variable"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/Controller/)
    rendered.should match(/Action/)
    rendered.should match(/Variable/)
  end
end
