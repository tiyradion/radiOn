class AddColumnsToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :request, :boolean
    add_column :artists, :comment, :string
  end
end
