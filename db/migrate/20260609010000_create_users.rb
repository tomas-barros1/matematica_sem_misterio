class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :role, null: false, default: 0
      t.integer :xp, null: false, default: 0
      t.integer :level, null: false, default: 1
      t.integer :streak, null: false, default: 0
      t.datetime :last_study_at

      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :xp
    add_index :users, :level
    add_index :users, :streak
    add_index :users, :role
  end
end
