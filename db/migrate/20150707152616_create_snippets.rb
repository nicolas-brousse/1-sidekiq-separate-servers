class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :language
      t.string :plain_code
      t.string :highlighted_code
      t.string :created_by
      t.string :updated_by

      t.timestamps null: false
    end
  end
end
