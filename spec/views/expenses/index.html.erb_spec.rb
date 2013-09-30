require 'spec_helper'

describe "expenses/index" do
  before(:each) do
    assign(:expenses, [
      stub_model(Expense,
        :expense_type_id => 1,
        :value => 1.5,
        :description => "MyText",
        :asset_life => 2,
        :user_id => 3
      ),
      stub_model(Expense,
        :expense_type_id => 1,
        :value => 1.5,
        :description => "MyText",
        :asset_life => 2,
        :user_id => 3
      )
    ])
  end

  it "renders a list of expenses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
