require 'spec_helper'

describe "tax_returns/show" do
  before(:each) do
    @tax_return = assign(:tax_return, stub_model(TaxReturn,
      :user_id => 1,
      :loss => 1.5,
      :pension => 1.5,
      :UTR => "Utr",
      :dividend => 1.5,
      :interest => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/Utr/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
