require 'spec_helper'

describe "targets/index" do
  before(:each) do
    assign(:targets, [
      stub_model(Target,
        :user_id => 1,
        :targets => "MyText",
        :year => 2
      ),
      stub_model(Target,
        :user_id => 1,
        :targets => "MyText",
        :year => 2
      )
    ])
  end

  it "renders a list of targets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
