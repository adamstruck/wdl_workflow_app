class ValidateWorkflowWorker
  include Sidekiq::Worker

  def perform(workflow_id)
    workflow = Workflow.find(workflow_id)
    workflow.validate_with_cromwell!    
  end
  
end
