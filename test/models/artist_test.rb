require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  setup do
    @artist = artists(:michael_jackson)
    @station = stations(:david)
  end

  test "artist" do
    assert_equal "Michael Jackson", @artist.name
  end

  test "promoter" do
    assert_equal "Jim James", @artist.promoter.name
  end

  test "number of comments" do
    assert_equal 2, @artist.comments.count
  end

  test "request record" do
    @artist.request_record(true, @station.id)
    assert_equal 1, @station.requests.count
  end
end
