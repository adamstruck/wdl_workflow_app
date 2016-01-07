class RunJobWorker
  include Sidekiq::Worker

  def perform(job_id)
    job = Job.find(job_id)
    job.run!
    unless job.status == "Succeeded"
      sleep 10
      job.check_status!
    else
      job.fetch_outputs!
      job.fetch_metadata!
    end
  end
end
