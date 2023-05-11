require "rails_helper"

RSpec.describe Artist, type: :model do
  describe "relationships" do
    it { should have_many :songs}
  end
end