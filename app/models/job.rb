class Job < ActiveRecord::Base

  belongs_to :workflow

  serialize :inputs
  serialize :options
  serialize :outputs
  serialize :metadata

  def run!
    response = RestClient.post("http://0.0.0.0:8000/api/workflows/v1",
                               {:wdlSource => workflow.wdl_source,
                                :workflowInputs => inputs.to_json,
                                :workflowOptions => options.to_json,
                                :multipart => true})
    
    update(status: JSON.parse(response.body)['status'])
    update(job_process_uuid: JSON.parse(response.body)['id'])
    update(started_at: response.headers[:date].to_datetime)
  end

  def check_status!
    response = RestClient.get("http://0.0.0.0:8000/api/workflows/v1/#{job_process_uuid}/status")
    update(status: JSON.parse(response.body)['status'])
    if status == "Succeeded"      
      update(completed_at: response.headers[:date].to_datetime)
    end
  end

  def fetch_metadata!
    response = RestClient.get("http://0.0.0.0:8000/api/workflows/v1/#{job_process_uuid}/metadata")
    update(metadata: JSON.parse(response.body))
  end
  
  def fetch_results!
    response = RestClient.get("http://0.0.0.0:8000/api/workflows/v1/#{job_process_uuid}/results")
    update(outputs: JSON.parse(response.body)['outputs'])
  end
  
end
