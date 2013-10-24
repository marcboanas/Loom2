require 'spec_helper'

describe "targets/new" do
  before(:each) do
    assign(:target, stub_model(Target,
      :user_id => 1,
      :targets => "MyText",
      :year => 1
    ).as_new_record)
  end

  it "renders new target form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => targets_path, :method => "post" do
      assert_select "input#target_user_id", :name => "target[user_id]"
      assert_select "textarea#target_targets", :name => "target[targets]"
      assert_select "input#target_year", :name => "target[year]"
    end
  end
end
