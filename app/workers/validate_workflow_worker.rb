class ValidateWorkflowWorker
  include Sidekiq::Worker

  def perform(workflow_id)
    workflow = Workflow.find(workflow_id)
    workflow.cromwell_validate!    
  end
  
end
