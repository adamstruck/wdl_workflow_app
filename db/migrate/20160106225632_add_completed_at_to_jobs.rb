class AddCompletedAtToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :completed_at, :datetime
    add_column :jobs, :started_at, :datetime
    remove_column :jobs, :run_at, :datetime
  end
end
