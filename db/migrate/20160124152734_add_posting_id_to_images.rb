class AddPostingIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :posting_id, :integer
  end
end
