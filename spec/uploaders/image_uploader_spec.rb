require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe ImageUploader do
  include CarrierWave::Test::Matchers

  before(:all) do
    ImageUploader.enable_processing = true
  end

  before(:each) do
    @uploader = ImageUploader.new(Image.new)
    @uploader.store!(File.open("#{Rails.root}/spec/fixtures/ruby.png"))
  end

  after(:all) do
    ImageUploader.enable_processing = false
  end

  context 'the default version' do
    it 'scales down an image to be no larger than 800 by 800 pixels' do
      expect(@uploader).to be_no_larger_than(800, 800)
    end
  end

  context 'the thumb version' do
    it 'scales down an image to be no larger than 100 by 100 pixels' do
      expect(@uploader.thumb).to be_no_larger_than(100, 100)
    end
  end
end
