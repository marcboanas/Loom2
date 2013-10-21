require 'spec_helper'

describe "business_types/edit" do
  before(:each) do
    @business_type = assign(:business_type, stub_model(BusinessType,
      :business => "MyString"
    ))
  end

  it "renders the edit business_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => business_types_path(@business_type), :method => "post" do
      assert_select "input#business_type_business", :name => "business_type[business]"
    end
  end
end
