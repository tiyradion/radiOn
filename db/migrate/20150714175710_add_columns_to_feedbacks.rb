class AddColumnsToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :reviewed, :boolean
    add_column :feedbacks, :responded, :boolean
  end
end
