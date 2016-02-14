class CreateDirectivesUsers < ActiveRecord::Migration
  def change
    create_table :directives_users do |t|
      t.integer :user_id
      t.integer :directive_id
      t.string :type
    end
    add_index :directives_users, [:user_id, :directive_id], unique: true
  end
end
