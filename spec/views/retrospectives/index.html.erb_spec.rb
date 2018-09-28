# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'retrospectives/index', type: :view do
  before(:each) do
    assign(:retrospectives, [
             Retrospective.create!(
               title: 'Title',
               description: 'MyText',
               date: DateTime.now
             ),
             Retrospective.create!(
               title: 'Title',
               description: 'MyText',
               date: DateTime.now
             )
           ])
  end

  it 'renders a list of retrospectives' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
