class CreateNotes < ActiveRecord::Migration
  def up
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.string :type
      t.boolean :deleted, :default => false
      t.references(:users)
      t.timestamps
    end

    add_index("notes", "title")
  end

  def down
    drop_table("notes")
  end
end
