class LessonCompletionService
  Result = Struct.new(:completion, :xp_earned, :correct_answers, :total_questions, :streak_bonus, :unlocked_achievements, :notice, keyword_init: true)

  def initialize(user:, lesson:, answers:)
    @user = user
    @lesson = lesson
    @answers = answers.to_h.stringify_keys
  end

  def call
    ApplicationRecord.transaction do
      user.lock!

      correct_answers = lesson.questions.count { |question| question.answer_correct?(answers[question.id.to_s]) }
      total_questions = lesson.questions.size
      score = total_questions.zero? ? 0 : ((correct_answers.to_f / total_questions) * 100).round
      completion = user.lesson_completions.find_or_initialize_by(lesson: lesson)
      completion.score = score
      completion.answers = answers
      completion.completed_at = Time.current
      completion.save!

      streak_result = Gamification::StreakTracker.new(user: user, study_date: Time.current.to_date).call
      xp_earned = completion.previously_new_record? ? (correct_answers * Gamification::XpCalculator::CORRECT_ANSWER_XP) + Gamification::XpCalculator::LESSON_COMPLETION_XP + streak_result.bonus_xp : 0

      user.assign_attributes(
        xp: user.xp + xp_earned,
        streak: streak_result.streak,
        last_study_at: Time.current
      )
      user.save!

      unlocked_achievements = Gamification::AchievementUnlocker.new(user: user).call
      notice = if xp_earned.positive?
        "Você ganhou #{xp_earned} XP e concluiu a lição!"
      else
        "Sua pontuação da lição foi atualizada."
      end

      Result.new(
        completion: completion,
        xp_earned: xp_earned,
        correct_answers: correct_answers,
        total_questions: total_questions,
        streak_bonus: streak_result.bonus_xp,
        unlocked_achievements: unlocked_achievements,
        notice: notice
      )
    end
  end

  private

  attr_reader :user, :lesson, :answers
end
