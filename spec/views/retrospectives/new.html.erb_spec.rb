# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'retrospectives/new', type: :view do
  before(:each) do
    assign(:retrospective, Retrospective.new(
                             title: 'MyString',
                             description: 'MyText',
                             date: DateTime.now
                           ))
  end

  it 'renders new retrospective form' do
    render

    assert_select 'form[action=?][method=?]', retrospectives_path, 'post' do
      assert_select 'input[name=?]', 'retrospective[title]'

      assert_select 'textarea[name=?]', 'retrospective[description]'
    end
  end
end
