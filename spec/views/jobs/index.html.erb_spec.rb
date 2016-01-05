require 'rails_helper'

RSpec.describe "jobs/index", type: :view do
  before(:each) do
    assign(:jobs, [
      Job.create!(
        :wdl_id => "MyText",
        :inputs => "MyText",
        :options => "MyText",
        :status => "MyText",
        :results => "MyText"
      ),
      Job.create!(
        :wdl_id => "MyText",
        :inputs => "MyText",
        :options => "MyText",
        :status => "MyText",
        :results => "MyText"
      )
    ])
  end

  it "renders a list of jobs" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
