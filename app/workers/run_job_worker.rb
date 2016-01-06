class CreateWorkflowHtmlWorker
  include Sidekiq::Worker

  def perform(job_id)
    job = Job.find(job_id)
    job.run!
  end
  
end
