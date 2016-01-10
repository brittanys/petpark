class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :title
      t.string :age
      t.text :description

      t.timestamps null: false
    end
  end
end
