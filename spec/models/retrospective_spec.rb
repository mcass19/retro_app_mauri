# frozen_string_literal: true

require 'rails_helper'

describe Retrospective do
  describe 'validations' do
    subject { Retrospective.new }

    it 'is valid with valid attributes' do
      subject.title = 'Anything'
      subject.description = 'Anything'
      subject.date = DateTime.now
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      expect(subject).to_not be_valid
    end

    it 'is not valid without a description' do
      subject.title = 'Anything'
      expect(subject).to_not be_valid
    end

    it 'is not valid without a start_date' do
      subject.title = 'Anything'
      subject.description = 'Lorem ipsum dolor sit amet'
      expect(subject).to_not be_valid
    end
  end
end
