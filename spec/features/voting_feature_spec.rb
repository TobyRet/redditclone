require 'spec_helper'

describe 'voting for posts' do 

  before { create(:post) }

  describe 'upvoting' do
    it 'adds points', js: true do
      visit '/posts'
      click_button 'Upvote'
      expect(page).to have_css('.votes_count', text: '1')
    end
  end

  describe 'downvoting' do
    it 'subtracts points', js: true do
      visit '/posts'
      click_button 'Downvote'
      expect(page).to have_css('.votes_count', text: '-1')
    end
  end
  
end