class RunJobWorker
  include Sidekiq::Worker

  def perform(job_id)
    job = Job.find(job_id)
    job.run!

    until job.status == "Succeeded"
      job.check_status!
      sleep 10
    end
    
    job.fetch_outputs!
    job.fetch_metadata!
  end
end
