class CreateUserTaskIntermediates < ActiveRecord::Migration
  def change
    create_table :user_task_intermediates do |t|
      
      t.belongs_to :task
      t.belongs_to :user

      t.integer :task_id
      t.integer :user_id
      t.integer :number
      t.string :description
      t.boolean :is_done

      t.timestamps
    end
  end
end
