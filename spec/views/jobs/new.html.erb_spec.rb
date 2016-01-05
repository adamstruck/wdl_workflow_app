require 'rails_helper'

RSpec.describe "jobs/new", type: :view do
  before(:each) do
    assign(:job, Job.new(
      :wdl_id => "MyText",
      :inputs => "MyText",
      :options => "MyText",
      :status => "MyText",
      :results => "MyText"
    ))
  end

  it "renders new job form" do
    render

    assert_select "form[action=?][method=?]", jobs_path, "post" do

      assert_select "textarea#job_wdl_id[name=?]", "job[wdl_id]"

      assert_select "textarea#job_inputs[name=?]", "job[inputs]"

      assert_select "textarea#job_options[name=?]", "job[options]"

      assert_select "textarea#job_status[name=?]", "job[status]"

      assert_select "textarea#job_results[name=?]", "job[results]"
    end
  end
end
