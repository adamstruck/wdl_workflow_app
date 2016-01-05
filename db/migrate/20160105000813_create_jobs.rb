class CreateJobs < ActiveRecord::Migration

  def change
    add_column :workflows, :name, :string
    add_column :workflows, :tags, :text

    create_table :jobs do |t|
      t.belongs_to :workflow, index: true
      t.text :inputs
      t.text :options
      t.datetime :run_at
      t.string :status
      t.text :results

      t.timestamps null: false
    end        
  end
end
