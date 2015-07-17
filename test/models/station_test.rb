require 'test_helper'

class StationTest < ActiveSupport::TestCase
  setup do
    @station = stations(:david)
    @promoter = promoters(:bobby)
  end

  test "artist not reviewed" do
    assert_equal 0, @station.artists_not_reviewed.count
  end

  test "unresponded feedback from one promoter" do
    assert_equal 1, @station.unresponded_feedback(@promoter.id).count
  end

end
