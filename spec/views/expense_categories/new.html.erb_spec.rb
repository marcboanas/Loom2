require 'spec_helper'

describe "expense_categories/new" do
  before(:each) do
    assign(:expense_category, stub_model(ExpenseCategory,
      :category => "MyString"
    ).as_new_record)
  end

  it "renders new expense_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => expense_categories_path, :method => "post" do
      assert_select "input#expense_category_category", :name => "expense_category[category]"
    end
  end
end
