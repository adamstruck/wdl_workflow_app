json.array!(@jobs) do |job|
  json.extract! job, :id, :wdl_id, :inputs, :options, :run_at, :status, :results
  json.url job_url(job, format: :json)
end
