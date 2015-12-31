require 'rails_helper'

RSpec.describe "workflows/index", type: :view do
  before(:each) do
    assign(:workflows, [
      Workflow.create!(
        :wdl_source => "",
        :is_valid => false,
        :html => "MyText",
        :inputs => "MyText",
        :options => "MyText"
      ),
      Workflow.create!(
        :wdl_source => "",
        :is_valid => false,
        :html => "MyText",
        :inputs => "MyText",
        :options => "MyText"
      )
    ])
  end

  it "renders a list of workflows" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
