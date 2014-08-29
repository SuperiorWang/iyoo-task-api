class CreateAlertTasks < ActiveRecord::Migration
  def change
    create_table :alert_tasks do |t|
      t.belongs_to :user_task_intermediate
      t.belongs_to :firend_relationship
    		
      t.integer :user_task_intermediate_id
      t.integer :friend_relationship_id
      t.boolean :has_alert

      t.timestamps
    end
  end
end
