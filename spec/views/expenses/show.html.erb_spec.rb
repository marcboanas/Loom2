require 'spec_helper'

describe "expenses/show" do
  before(:each) do
    @expense = assign(:expense, stub_model(Expense,
      :expense_type_id => 1,
      :value => 1.5,
      :description => "MyText",
      :asset_life => 2,
      :user_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/1.5/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
