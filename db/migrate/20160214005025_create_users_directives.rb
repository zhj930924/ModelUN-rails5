class CreateUsersDirectives < ActiveRecord::Migration
  def change
    create_table :users_directives do |t|
      t.integer :user_id
      t.integer :directive_id
    end
    add_index :users_directives, :user_id
    add_index :users_directives, :directive_id
    add_index :users_directives, [:user_id, :directive_id], unique: true
  end
end