class Question < ApplicationRecord
  belongs_to :lesson

  enum :kind, { multiple_choice: 0, true_false: 1 }, default: :multiple_choice

  validates :statement, presence: true
  validates :correct_answer, presence: true
  validates :position, numericality: { greater_than_or_equal_to: 0 }
  validates :lesson, presence: true
  validates :option_a, :option_b, :option_c, :option_d, presence: true, if: :multiple_choice?
  validate :correct_answer_matches_kind

  def option_pairs
    [ [ "a", option_a ], [ "b", option_b ], [ "c", option_c ], [ "d", option_d ] ]
  end

  def correct_option_label
    multiple_choice? ? correct_answer : (correct_answer == "true" ? "Verdadeiro" : "Falso")
  end

  def answer_correct?(submitted_answer)
    submitted_answer.to_s == correct_answer.to_s
  end

  private

  def correct_answer_matches_kind
    if multiple_choice? && %w[a b c d].exclude?(correct_answer)
      errors.add(:correct_answer, "deve ser a, b, c ou d")
    elsif true_false? && %w[true false].exclude?(correct_answer)
      errors.add(:correct_answer, "deve ser true ou false")
    end
  end
end
