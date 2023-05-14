require "rails_helper"

RSpec.describe "#delete artist" do
  it "can delete the artist from the index page" do
    artist = Artist.create!(name: "Prince")

    visit "/artists"
    click_button "Delete"

    expect(current_path).to eq("/artists")
    expect(page).to_not have_content("Prince")
  end
end