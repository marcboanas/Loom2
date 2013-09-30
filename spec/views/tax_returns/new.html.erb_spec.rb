require 'spec_helper'

describe "tax_returns/new" do
  before(:each) do
    assign(:tax_return, stub_model(TaxReturn,
      :user_id => 1,
      :loss => 1.5,
      :pension => 1.5,
      :UTR => "MyString",
      :dividend => 1.5,
      :interest => 1.5
    ).as_new_record)
  end

  it "renders new tax_return form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tax_returns_path, :method => "post" do
      assert_select "input#tax_return_user_id", :name => "tax_return[user_id]"
      assert_select "input#tax_return_loss", :name => "tax_return[loss]"
      assert_select "input#tax_return_pension", :name => "tax_return[pension]"
      assert_select "input#tax_return_UTR", :name => "tax_return[UTR]"
      assert_select "input#tax_return_dividend", :name => "tax_return[dividend]"
      assert_select "input#tax_return_interest", :name => "tax_return[interest]"
    end
  end
end
