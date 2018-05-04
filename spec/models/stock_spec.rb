require 'rails_helper'

RSpec.describe Stock, type: :model do
  it { is_expected.to belong_to :shop }
  it { is_expected.to belong_to :book }

  it { is_expected.to validate_presence_of :book }
  it { is_expected.to validate_presence_of :shop }
  it { is_expected.to validate_presence_of :copies }
end
