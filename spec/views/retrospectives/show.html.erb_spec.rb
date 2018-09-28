# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'retrospectives/show', type: :view do
  before(:each) do
    @retrospective = assign(:retrospective, Retrospective.create!(
                                              title: 'Title',
                                              description: 'MyText',
                                              date: DateTime.now
                                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
