class AddPictureToFeedbacks < ActiveRecord::Migration[4.2]
  def change
    add_column :feedbacks, :picture, :string
  end
end
