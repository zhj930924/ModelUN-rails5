class CreateUsers < ActiveRecord::Migration
  def change
   create_table :users do |t|
      t.string :real_name
      t.string :committee
      t.string :position
      t.string :email
      t.integer :graduation_class
      t.string :password
      t.string  :password_digest 
      t.string :remember_digest 
      t.boolean :admin 
      t.string :type 
      t.string :activation_digest 
      t.boolean :activated 
      t.datetime :activated_at 
      
      t.timestamps null: false
    end
  end
end
