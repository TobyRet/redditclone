require 'spec_helper'

describe 'posts index page' do

  context 'no posts' do
    it 'shows a message' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
    end
  end

  describe 'adding posts' do
    context 'valid post' do
      it 'is added to the posts page' do
        visit '/posts/new'
        fill_in 'Description', with: 'Here is a post'
        click_button 'Submit'

        expect(current_path).to eq '/posts'
        expect(page).to have_content 'Here is a post'
      end
    end

    context 'invalid post' do
      xit 'shows an error' do
        visit '/posts/new'
        click_button 'Submit'

        expect(page).to have_content 'error'
      end
    end
  end

  context 'with posts' do
    before { create(:post) }

    xit 'displays the post' do
      visit '/posts'
      expect(page).to have_content 'Some awesome snap'
    end
  end
end
