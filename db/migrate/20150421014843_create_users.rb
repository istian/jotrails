class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :password_hashed
      t.string :password_salt
      t.string :email, :limit => 50
      t.string :first_name, :limit => 50
      t.string :last_name, :limit => 50
      t.date :birthdate
      t.boolean :is_active, :default => false
      t.timestamps
    end

    add_index("users", "username")
    add_index("users", "email")
  end

  def down
    drop_table :users
  end
end
