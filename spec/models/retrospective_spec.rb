# frozen_string_literal: true

require 'rails_helper'

describe Retrospective do
  subject do
    Retrospective.new(
      title: 'Anything',
      description: 'Lorem ipsum',
      date: Time.zone.now
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a start_date' do
    subject.date = nil
    expect(subject).to_not be_valid
  end
end
