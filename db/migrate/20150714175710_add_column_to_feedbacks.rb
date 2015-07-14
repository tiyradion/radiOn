class AddColumnToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :reviewed, :boolean
  end
end
