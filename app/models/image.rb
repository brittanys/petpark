class Image < ActiveRecord::Base
  mount_uploader :name, ImageUploader
  belongs_to :posting
end
