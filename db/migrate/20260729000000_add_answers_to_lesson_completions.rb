class AddAnswersToLessonCompletions < ActiveRecord::Migration[8.1]
  def change
    add_column :lesson_completions, :answers, :json, default: {}, null: false
  end
end
