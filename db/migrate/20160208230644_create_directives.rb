class CreateDirectives < ActiveRecord::Migration
  def change
    create_table :directives do |t|
        t.string :title
        t.text   :content
        t.string :type
        t.boolean :editable, default: true
        t.boolean :public, default: false
        t.boolean :passed, default: true
        t.timestamps null: false

    end
  end
end
