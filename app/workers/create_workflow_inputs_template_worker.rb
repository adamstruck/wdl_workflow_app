class CreateWorkflowInputsTemplateWorker
  include Sidekiq::Worker

  def perform(workflow_id)
    workflow = Workflow.find(workflow_id)
    workflow.cromwell_create_inputs_template!    
  end
  
end
