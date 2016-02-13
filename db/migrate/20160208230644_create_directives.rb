class CreateDirectives < ActiveRecord::Migration
  def change
    create_table :directives do |t|
        t.string :title
        t.text   :content
        t.string :type
        t.timestamps null: false
    end
  end
end
