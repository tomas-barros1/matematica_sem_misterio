require "rails_helper"

RSpec.describe Gamification::LevelCalculator do
  describe ".level_for" do
    it "returns the correct level" do
      expect(described_class.level_for(0)).to eq(1)
      expect(described_class.level_for(120)).to eq(2)
      expect(described_class.level_for(260)).to eq(3)
    end
  end

  describe ".progress_for" do
    it "returns progress metadata" do
      progress = described_class.progress_for(260)

      expect(progress[:level]).to eq(3)
      expect(progress[:percentage]).to be_between(0, 100)
    end
  end
end
