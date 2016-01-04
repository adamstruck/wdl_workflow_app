class CreateWorkflowHtmlWorker
  include Sidekiq::Worker

  def perform(workflow_id)
    workflow = Workflow.find(workflow_id)
    workflow.cromwell_create_html!    
  end
  
end
