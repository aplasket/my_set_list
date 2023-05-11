require "rails_helper"

RSpec.describe Artist, type: :model do
  describe "relationships" do
    it { should have_many :songs}
  end

  describe "instance methods" do
    describe "average song length" do
      let!(:prince) { Artist.create!(name: "Prince") }
      let!(:purple) { prince.songs.create!(title: "Purple Rain", length: 239, play_count: 2731) }
      let!(:beret) { prince.songs.create!(title: "Raspberry Beret", length: 243, play_count: 1239) }
      let!(:other_song) { prince.songs.create!(title: "Another Prince Song", length: 2, play_count: 539) }

      it "returns average song length" do
        expect(prince.average_song_length.round(2)).to eq(161.33)
      end
    end
  end
end