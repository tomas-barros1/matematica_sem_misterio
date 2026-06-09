class CreateSubjects < ActiveRecord::Migration[8.1]
  def change
    create_table :subjects do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :position, null: false, default: 0

      t.timestamps
    end

    add_index :subjects, :name, unique: true
    add_index :subjects, :position
  end
end
