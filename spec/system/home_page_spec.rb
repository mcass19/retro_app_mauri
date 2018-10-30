# frozen_string_literal: true

require 'rails_helper'

describe 'HomePage' do
  before do
    driven_by :chrome
  end

  it 'renders the image, text and button of the home page' do
    visit root_url
    expect(page).to have_css "img[src*='wye-logo']"
    expect(page).to have_text 'Welcome to WyeRetro App!'
    expect(page).to have_button 'Start'
    click_button 'Start'
    expect(page).to have_current_path(retrospectives_path)
  end
end
