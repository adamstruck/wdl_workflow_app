class CheckJobStatusWorker
  include Sidekiq::Worker

  def perform(job_id)    
    job = Job.find(job_id)
    job.check_status!
  end
  
end
