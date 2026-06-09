require "rails_helper"

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to define_enum_for(:role).with_values(student: 0, admin: 1).with_default(:student) }
  it { is_expected.to validate_numericality_of(:xp).is_greater_than_or_equal_to(0) }
  it { is_expected.to validate_numericality_of(:streak).is_greater_than_or_equal_to(0) }

  it "syncs the level from xp" do
    user.xp = 260
    user.valid?

    expect(user.level).to eq(3)
  end
end
