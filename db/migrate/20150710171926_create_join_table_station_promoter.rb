class CreateJoinTableStationPromoter < ActiveRecord::Migration
  def change
    create_join_table :stations, :promoters do |t|
      t.index [:station_id, :promoter_id]
      # t.index [:promoter_id, :station_id]
    end
  end
end
