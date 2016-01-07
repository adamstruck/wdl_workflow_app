class AddMetadataToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :job_process_uuid, :string
    add_column :jobs, :outputs, :text, default: {}
    add_column :jobs, :metadata, :text, default: {}
    remove_column :jobs, :results, :text
  end
end
