class CreateSocialRecords < ActiveRecord::Migration
  def change
    create_table :social_records do |t|
      t.belongs_to :user
      t.belongs_to :task

      t.integer :task_id
      t.integer :user_id
      t.integer :friend_id
      t.boolean :pinch
      t.boolean :award

      t.timestamps
    end
  end
end
