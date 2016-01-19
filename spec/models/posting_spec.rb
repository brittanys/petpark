require 'rails_helper'

RSpec.describe Posting, type: :model do
  let(:posting) { create(:posting) }
  it 'is invalid without a title' do
    expect(posting).to be_valid
  end
  it 'is invalid without a description'
end
