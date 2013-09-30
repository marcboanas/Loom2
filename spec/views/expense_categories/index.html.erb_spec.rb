require 'spec_helper'

describe "expense_categories/index" do
  before(:each) do
    assign(:expense_categories, [
      stub_model(ExpenseCategory,
        :category => "Category"
      ),
      stub_model(ExpenseCategory,
        :category => "Category"
      )
    ])
  end

  it "renders a list of expense_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
