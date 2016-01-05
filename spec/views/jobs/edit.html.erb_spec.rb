require 'rails_helper'

RSpec.describe "jobs/edit", type: :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      :wdl_id => "MyText",
      :inputs => "MyText",
      :options => "MyText",
      :status => "MyText",
      :results => "MyText"
    ))
  end

  it "renders the edit job form" do
    render

    assert_select "form[action=?][method=?]", job_path(@job), "post" do

      assert_select "textarea#job_wdl_id[name=?]", "job[wdl_id]"

      assert_select "textarea#job_inputs[name=?]", "job[inputs]"

      assert_select "textarea#job_options[name=?]", "job[options]"

      assert_select "textarea#job_status[name=?]", "job[status]"

      assert_select "textarea#job_results[name=?]", "job[results]"
    end
  end
end
