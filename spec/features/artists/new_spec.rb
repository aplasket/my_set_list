require "rails_helper"

RSpec.describe "/artists/new" do
  it "links to the new page from the artist index page" do
    visit "/artists"
    expect(page).to have_link("New Artist")
    
    click_link("New Artist")
    expect(current_path).to eq("/artists/new")
  end

  it "can create a new artist" do
    visit "/artists/new"

    fill_in("Name", with: "Janice")
    click_button("Create Artist")

    # new_artist_id = Artist.last.id
    # expect(current_path).to eq("/artists/#{new_artist_id}")
    expect(current_path).to eq("/artists")
    expect(page).to have_content("Janice")
    
  end
end