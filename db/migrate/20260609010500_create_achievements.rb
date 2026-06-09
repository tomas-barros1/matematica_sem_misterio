class CreateAchievements < ActiveRecord::Migration[8.1]
  def change
    create_table :achievements do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integer :xp_requirement, null: false, default: 0
      t.integer :streak_requirement
      t.integer :lesson_completion_requirement

      t.timestamps
    end

    add_index :achievements, :code, unique: true
    add_index :achievements, :name, unique: true
  end
end
