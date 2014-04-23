require 'spec_helper'

describe 'voting for posts' do
  let(:toby) { create(:toby) }

  before do 
    create(:post, user: toby)
    clear_emails
    login_as create(:rivka)
  end

  describe 'upvoting' do

    it 'adds points', js: true do
      visit '/posts'
      click_button 'Upvote'
      expect(page).to have_css('.votes_count', text: '1')
    end

    it 'sends an email notifying the user of the vote', js: true do
      visit '/posts' 
      click_button 'Upvote'
      sleep 1
      open_email('toby@toby.com')
      expect(current_email).to have_content('Your post got upvoted')
    end

  end

  describe 'downvoting' do

    it 'subtracts points', js: true do
      visit '/posts'
      click_button 'Downvote'
      expect(page).to have_css('.votes_count', text: '-1')
    end

    it 'sends an email notifying the user of the vote', js: true do
      visit '/posts' 
      click_button 'Downvote'
      sleep 1
      open_email('toby@toby.com')
      expect(current_email).to have_content('Your post got downvoted')
    end
  end
  
end