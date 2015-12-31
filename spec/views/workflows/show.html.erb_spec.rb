require 'rails_helper'

RSpec.describe "workflows/show", type: :view do
  before(:each) do
    @workflow = assign(:workflow, Workflow.create!(
      :wdl_source => "",
      :is_valid => false,
      :html => "MyText",
      :inputs => "MyText",
      :options => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
