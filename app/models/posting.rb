class Posting < ActiveRecord::Base

  validates :title, :description, presence: true 
end
