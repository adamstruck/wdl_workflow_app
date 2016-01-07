class RunJobWorker
  include Sidekiq::Worker

  def perform(job_id)
    job = Job.find(job_id)
    job.run!
    job.check_status!
    if job.status == "Succeeded"
      job.fetch_outputs!
      job.fetch_metadata!
    else
      sleep 10
      job.check_status!      
    end
  end
end
