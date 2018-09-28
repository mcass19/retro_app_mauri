# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'retrospectives/edit', type: :view do
  before(:each) do
    @retrospective = assign(:retrospective, Retrospective.create!(
                                              title: 'MyString',
                                              description: 'MyText',
                                              date: DateTime.now
                                            ))
  end

  it 'renders the edit retrospective form' do
    render

    assert_select 'form[action=?][method=?]',
                  retrospective_path(@retrospective), 'post' do
      assert_select 'input[name=?]', 'retrospective[title]'

      assert_select 'textarea[name=?]', 'retrospective[description]'
    end
  end
end
