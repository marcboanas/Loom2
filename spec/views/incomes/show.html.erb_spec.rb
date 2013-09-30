require 'spec_helper'

describe "incomes/show" do
  before(:each) do
    @income = assign(:income, stub_model(Income,
      :test => false,
      :description => "MyText",
      :value => 1.5,
      :student_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    rendered.should match(/MyText/)
    rendered.should match(/1.5/)
    rendered.should match(/1/)
  end
end
