class Posting < ActiveRecord::Base
  belongs_to :user
  has_many :images, inverse_of: :posting, dependent: :destroy

  validates :title, :description, presence: true
  accepts_nested_attributes_for :images, allow_destroy: true
end
