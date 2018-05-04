require 'rails_helper'

RSpec.describe Shop, type: :model do
  it { is_expected.to have_many :stocks }
  it { is_expected.to have_many(:books).through(:stocks) }

  it { is_expected.to validate_presence_of :name }
end
