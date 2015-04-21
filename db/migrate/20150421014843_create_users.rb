class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :first_name, :limit => 50
      t.string :last_name, :limit => 50
      t.string :email
      t.date :birthdate
      t.string :password_salt
      t.string :password_hashed
      t.timestamps
    end

    add_index("users", "email")
  end

  def down
    drop_table("users")
  end
end
