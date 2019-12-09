require 'rails_helper'

describe 'As a visitor' do
  describe 'When I select Gryffindor from the select field and click search' do
    before(:each) do
      visit '/'
      select "Gryffindor", :from => "house"
      click_button 'Search For Members'
    end

    it "my current path is /search" do
      expect(current_path).to eq('/search')
      within(".title") do
        expect(page).to have_content("Gryffindor")
      end
    end

    it "I see 21 members on the list" do
      expect(page).to have_css(".member", count: 21)
    end

    it "Each member has name, role, house, and patronus if they exist" do
      within (first(".member")) do
        expect(page).to have_css(".name")
        expect(page).to have_css(".role")
        expect(page).to have_css(".house")
        expect(page).to have_css(".patronus")
      end
    end
  end
end
