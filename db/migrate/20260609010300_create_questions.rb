class CreateQuestions < ActiveRecord::Migration[8.1]
  def change
    create_table :questions do |t|
      t.references :lesson, null: false, foreign_key: true
      t.integer :kind, null: false, default: 0
      t.text :statement, null: false
      t.text :option_a
      t.text :option_b
      t.text :option_c
      t.text :option_d
      t.string :correct_answer, null: false
      t.text :explanation
      t.integer :position, null: false, default: 0

      t.timestamps
    end

    add_index :questions, [ :lesson_id, :position ]
    add_index :questions, :kind
  end
end
