class CreateLessons < ActiveRecord::Migration[8.1]
  def change
    create_table :lessons do |t|
      t.references :subject, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false
      t.integer :position, null: false, default: 0
      t.integer :xp_reward, null: false, default: 50
      t.boolean :active, null: false, default: true

      t.timestamps
    end

    add_index :lessons, [ :subject_id, :position ]
    add_index :lessons, :active
  end
end
