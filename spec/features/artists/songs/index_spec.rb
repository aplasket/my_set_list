require "rails_helper"

RSpec.describe "Artists songs index" do
  let!(:prince) { Artist.create!(name: "Prince") }
  let!(:purple) { prince.songs.create!(title: "Purple Rain", length: 239, play_count: 2731) }
  let!(:beret) { prince.songs.create!(title: "Raspberry Beret", length: 123, play_count: 1239) }

  it "shows all titles of songs for the artists" do
    visit "/artists/#{prince.id}/songs"

    expect(page).to have_content(purple.title)
    expect(page).to have_content(beret.title)
  end

  it "links to each songs show page" do
    visit "/artists/#{prince.id}/songs"

    click_on purple.title

    expect(current_path).to eq("/songs/#{purple.id}")
  end

  it "shows the average length for the artist" do
    visit "/artists/#{prince.id}/songs"

    expect(page).to have_content("Average Song Length for Prince: 181")

  end
end