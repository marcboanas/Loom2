require 'spec_helper'

describe "business_types/index" do
  before(:each) do
    assign(:business_types, [
      stub_model(BusinessType,
        :business => "Business"
      ),
      stub_model(BusinessType,
        :business => "Business"
      )
    ])
  end

  it "renders a list of business_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Business".to_s, :count => 2
  end
end
