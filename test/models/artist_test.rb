require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  setup do
    @artist = artists(:michael_jackson)
    @station = stations(:david)
    @promoter = @artist.promoter
  end

  test "artist" do
    assert_equal "Michael Jackson", @artist.name
  end

  test "promoter" do
    assert_equal "Jim James", @artist.promoter.name
  end

  test "number of feedbacks" do
    assert_equal 2, @artist.feedbacks.count
  end

  # test "request record" do
  #   @artist.request_record(true, @station.id)
  #   assert_equal 1, @station.requests.count
  #   assert_equal 1, @promoter.requests.count
  # end
  #
  # test "add comment" do
  #   @artist.add_comment("Awesome tunes", @station.id)
  #   assert_equal 4, @station.comments.count
  #   assert_equal 4, @promoter.comments.count

  # end
end
