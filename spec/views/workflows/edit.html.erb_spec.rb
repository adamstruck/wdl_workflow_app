require 'rails_helper'

RSpec.describe "workflows/edit", type: :view do
  before(:each) do
    @workflow = assign(:workflow, Workflow.create!(
      :wdl_source => "",
      :is_valid => false,
      :html => "MyText",
      :inputs => "MyText",
      :options => "MyText"
    ))
  end

  it "renders the edit workflow form" do
    render

    assert_select "form[action=?][method=?]", workflow_path(@workflow), "post" do

      assert_select "input#workflow_wdl_source[name=?]", "workflow[wdl_source]"

      assert_select "input#workflow_is_valid[name=?]", "workflow[is_valid]"

      assert_select "textarea#workflow_html[name=?]", "workflow[html]"

      assert_select "textarea#workflow_inputs[name=?]", "workflow[inputs]"

      assert_select "textarea#workflow_options[name=?]", "workflow[options]"
    end
  end
end
