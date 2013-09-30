require 'spec_helper'

describe "incomes/index" do
  before(:each) do
    assign(:incomes, [
      stub_model(Income,
        :test => false,
        :description => "MyText",
        :value => 1.5,
        :student_id => 1
      ),
      stub_model(Income,
        :test => false,
        :description => "MyText",
        :value => 1.5,
        :student_id => 1
      )
    ])
  end

  it "renders a list of incomes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
