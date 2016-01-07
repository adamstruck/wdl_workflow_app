class ProcessWorkflowWorker
  include Sidekiq::Worker

  def perform(workflow_id)
    workflow = Workflow.find(workflow_id)
    workflow.cromwell_validate!
    if workflow.is_valid
      workflow.cromwell_create_html!
      workflow.cromwell_create_inputs_template!
    end
  end  
end
