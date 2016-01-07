class FetchJobOutputsWorker
  include Sidekiq::Worker

  def perform(job_id)
    job = Job.find(job_id)
    job.fetch_outputs!
  end
  
end
