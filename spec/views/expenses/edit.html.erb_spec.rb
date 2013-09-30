require 'spec_helper'

describe "expenses/edit" do
  before(:each) do
    @expense = assign(:expense, stub_model(Expense,
      :expense_type_id => 1,
      :value => 1.5,
      :description => "MyText",
      :asset_life => 1,
      :user_id => 1
    ))
  end

  it "renders the edit expense form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => expenses_path(@expense), :method => "post" do
      assert_select "input#expense_expense_type_id", :name => "expense[expense_type_id]"
      assert_select "input#expense_value", :name => "expense[value]"
      assert_select "textarea#expense_description", :name => "expense[description]"
      assert_select "input#expense_asset_life", :name => "expense[asset_life]"
      assert_select "input#expense_user_id", :name => "expense[user_id]"
    end
  end
end
