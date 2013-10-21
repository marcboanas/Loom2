require 'spec_helper'

describe "steps/index" do
  before(:each) do
    assign(:steps, [
      stub_model(Step,
        :step => 1,
        :complete => false,
        :controller => "Controller",
        :action => "Action",
        :variable => "Variable"
      ),
      stub_model(Step,
        :step => 1,
        :complete => false,
        :controller => "Controller",
        :action => "Action",
        :variable => "Variable"
      )
    ])
  end

  it "renders a list of steps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Controller".to_s, :count => 2
    assert_select "tr>td", :text => "Action".to_s, :count => 2
    assert_select "tr>td", :text => "Variable".to_s, :count => 2
  end
end
