class CreateWorkflows < ActiveRecord::Migration
  def change
    create_table :workflows do |t|
      t.text :wdl_source, null: false
      t.boolean :is_valid
      t.text :html
      t.text :inputs, default: {}
      t.text :options, default: {}

      t.timestamps null: false
    end
  end
end
