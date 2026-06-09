require "rails_helper"

RSpec.describe Subject, type: :model do
  subject(:subject_model) { build(:subject) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_numericality_of(:position).is_greater_than_or_equal_to(0) }
  it { is_expected.to have_many(:lessons).dependent(:destroy) }
end
