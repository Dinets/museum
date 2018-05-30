# frozen_string_literal: true

describe Authentication, type: :model do
  it { should validate_presence_of :provider }
  it { should validate_presence_of :uid }
  it { should belong_to :user }
end
