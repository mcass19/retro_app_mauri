# frozen_string_literal: true

require 'rails_helper'

describe 'NewRetrospective' do
  it 'renders the top navigation bar and the button to start new retro' do
    visit retrospectives_path

    expect(page).to have_css '.top_navigation_bar'
    expect(page).to have_button 'Start new Retro!'

    click_button 'Start new Retro!'

    expect(page).to have_current_path(new_retrospective_path)
  end

  it 'renders the top navigation bar and the button to post topics' do
    visit new_retrospective_path

    expect(page).to have_css '.top_navigation_bar'
    expect(page).to have_button 'Post your topics!'
  end
end

describe 'Display the topics boxes' do
  it 'renders the timer and the boxes to post topics when click on post
      topics button' do
    visit new_retrospective_path

    click_button 'Post your topics!'

    expect(page).to have_css '#button_timer'
    expect(page).to have_button 'Sort & Discuss!'
    expect(page).to have_text 'To mention'
    expect(page).to have_text 'To discuss'
    expect(page).to have_css '.posting_phase__box', count: 2
    expect(page).to have_selector 'input', id: 'mention_input'
    expect(page).to have_selector 'input', id: 'discuss_input'
  end
end

describe 'Post topics' do
  it 'fill the inputs to post topics and check they are added to the lists' do
    visit new_retrospective_path

    click_button 'Post your topics!'

    fill_in 'mention_input', with: "Example mention one\n"
    fill_in 'mention_input', with: "Example mention two\n"

    expect(page).to have_text 'Example mention one'
    expect(page).to have_text 'Example mention two'
    expect(page).to have_css '#mention_list'
    expect(page).to have_css '.topics.list.mention', count: 2

    fill_in 'discuss_input', with: "Example discuss one\n"
    fill_in 'discuss_input', with: "Example discuss two\n"

    expect(page).to have_text 'Example discuss one'
    expect(page).to have_text 'Example discuss two'
    expect(page).to have_css '#discuss_list'
    expect(page).to have_css '.topics.list', count: 4
  end
end

describe 'Sort the topics' do
  it 'stops the timer, hide the inputs, display the start discussion button and
      sort the topics' do
    visit new_retrospective_path

    click_button 'Post your topics!'

    fill_in 'mention_input', with: "Example mention one\n"
    fill_in 'mention_input', with: "Example mention two\n"

    sleep 5

    click_button 'Sort & Discuss!'

    expect(page).to have_text '00:05'
    expect(page).to have_button 'Start Discussion!'

    page.execute_script("$('#mention_list li:first-child'
                          ).insertAfter($('#mention_list li:last-child'));")

    expect(page).to have_selector '#mention_list li:first-child',
                                  text: 'Example mention two'
    expect(page).to have_selector '#mention_list li:last-child',
                                  text: 'Example mention one'
  end
end

describe 'display the action plans boxes' do
  it 'start the timer again, hide the start discussion button and display the
      action plans box and the input' do
    visit new_retrospective_path

    click_button 'Post your topics!'

    click_button 'Sort & Discuss!'

    click_button 'Start Discussion!'

    expect(page).to have_text '00:00'
    expect(page).to_not have_button 'Start Discussion!'
    expect(page).to have_text 'Action plans'
    expect(page).to have_css '.action_plans__box'
    expect(page).to have_selector 'input', id: 'action_plan_input'
  end
end

describe 'Add action plans' do
  it 'fill the inputs to add action plans and check they are added to the
      lists' do
    visit new_retrospective_path

    click_button 'Post your topics!'

    click_button 'Sort & Discuss!'

    click_button 'Start Discussion!'

    fill_in 'action_plan_input', with: "Example action plan one\n"
    fill_in 'action_plan_input', with: "Example action plan two\n"

    expect(page).to have_text 'Example action plan one'
    expect(page).to have_text 'Example action plan two'
    expect(page).to have_css '#action_plans_list'
    expect(page).to have_css '.topics.list', count: 2
  end
end
