require 'spec_helper'

describe "expense_categories/edit" do
  before(:each) do
    @expense_category = assign(:expense_category, stub_model(ExpenseCategory,
      :category => "MyString"
    ))
  end

  it "renders the edit expense_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => expense_categories_path(@expense_category), :method => "post" do
      assert_select "input#expense_category_category", :name => "expense_category[category]"
    end
  end
end
