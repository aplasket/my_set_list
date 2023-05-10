require "rails_helper"

RSpec.describe "the songs show page", type: :feature do
  it "displays song title" do
    artist_1 = Artist.create!(name: "Carly Ray Jepsen")
    song_1 = artist_1.songs.create!(title: "I Really Like You",
                          length: 208,
                          play_count: 243810867)
    song_2 = artist_1.songs.create!(title: "Call Me Maybe",
                          length: 199,
                          play_count: 1214722172)

    visit "/songs/#{song_1.id}"

    expect(page).to have_content(song_1.title)
    expect(page).to_not have_content(song_2.title)

  end

  it "displays the name of the artist for the song" do
    artist_1 = Artist.create!(name: "Carly Ray Jepsen")
    song_1 = artist_1.songs.create!(title: "I Really Like You",
                          length: 208,
                          play_count: 243810867)
    song_2 = artist_1.songs.create!(title: "Call Me Maybe",
                          length: 199,
                          play_count: 1214722172)

    visit "/songs/#{song_1.id}"
    save_and_open_page

    expect(page).to have_content(artist_1.name)
  end
end