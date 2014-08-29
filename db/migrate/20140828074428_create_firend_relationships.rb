class CreateFirendRelationships < ActiveRecord::Migration
  def change
    create_table :firend_relationships do |t|
      t.belongs_to :user

      t.integer :user_id
      t.integer :firend

      t.timestamps
    end
  end
end
