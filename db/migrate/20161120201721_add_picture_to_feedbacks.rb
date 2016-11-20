class AddPictureToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :picture, :string
  end
end
