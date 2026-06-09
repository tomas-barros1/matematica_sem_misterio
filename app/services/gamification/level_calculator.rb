module Gamification
  class LevelCalculator
    LEVEL_THRESHOLDS = [ 0, 100, 250, 500, 900, 1400, 2000, 2900, 3900, 5000 ].freeze

    class << self
      def level_for(xp)
        LEVEL_THRESHOLDS.count { |threshold| xp >= threshold }
      end

      def progress_for(xp)
        current_level = level_for(xp)
        current_threshold = LEVEL_THRESHOLDS[current_level - 1] || 0
        next_threshold = LEVEL_THRESHOLDS[current_level] || (current_threshold + 1000)
        progress = xp - current_threshold
        total = next_threshold - current_threshold

        {
          level: current_level,
          current_xp: xp,
          current_threshold: current_threshold,
          next_threshold: next_threshold,
          progress: progress,
          total: total,
          percentage: total.zero? ? 100 : ((progress.to_f / total) * 100).round
        }
      end
    end
  end
end
