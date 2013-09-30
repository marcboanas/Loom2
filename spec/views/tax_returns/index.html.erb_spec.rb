require 'spec_helper'

describe "tax_returns/index" do
  before(:each) do
    assign(:tax_returns, [
      stub_model(TaxReturn,
        :user_id => 1,
        :loss => 1.5,
        :pension => 1.5,
        :UTR => "Utr",
        :dividend => 1.5,
        :interest => 1.5
      ),
      stub_model(TaxReturn,
        :user_id => 1,
        :loss => 1.5,
        :pension => 1.5,
        :UTR => "Utr",
        :dividend => 1.5,
        :interest => 1.5
      )
    ])
  end

  it "renders a list of tax_returns" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Utr".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
