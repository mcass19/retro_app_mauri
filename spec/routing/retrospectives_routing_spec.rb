# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RetrospectivesController, # rubocop:disable Metrics/BlockLength
               type: :routing do
  describe 'routing' do # rubocop:disable Metrics/BlockLength
    it 'routes to #index' do
      expect(get: '/retrospectives').to route_to('retrospectives#index')
    end

    it 'routes to #new' do
      expect(get: '/retrospectives/new').to route_to('retrospectives#new')
    end

    it 'routes to #show' do
      expect(get: '/retrospectives/1').to route_to('retrospectives#show',
                                                   id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/retrospectives/1/edit').to route_to('retrospectives#edit',
                                                        id: '1')
    end

    it 'routes to #create' do
      expect(post: '/retrospectives').to route_to('retrospectives#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/retrospectives/1').to route_to('retrospectives#update',
                                                   id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/retrospectives/1').to route_to('retrospectives#update',
                                                     id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/retrospectives/1').to route_to('retrospectives#destroy',
                                                      id: '1')
    end
  end
end
