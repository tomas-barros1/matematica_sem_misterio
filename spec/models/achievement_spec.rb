require "rails_helper"

RSpec.describe Achievement, type: :model do
  subject(:achievement) { build(:achievement) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:code) }
end
