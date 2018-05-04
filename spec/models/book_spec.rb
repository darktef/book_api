require 'rails_helper'

RSpec.describe Book, type: :model do
  it { is_expected.to belong_to :publisher }

  it { is_expected.to have_many :stocks }
  it { is_expected.to have_many(:shops).through(:stocks) }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :publisher }
end
