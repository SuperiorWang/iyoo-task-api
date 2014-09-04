class CreatePersonalData < ActiveRecord::Migration
  def change
    create_table :personal_data do |t|
      t.belongs_to :user
      t.string :nickname
      t.string :sex
      t.string :region
      t.string :treasure
      t.integer :friend_number
      t.integer :phone_number
      t.string :login_password

      t.timestamps
    end
  end
end
