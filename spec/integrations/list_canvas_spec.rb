require 'spec_helper'

describe 'list canvas' do
  subject(:list_canvas) { api.list_canvas }

  context 'with success', :vcr do
    it 'responds with success' do
      expect(list_canvas).to be_success
    end

    it 'responds with a list of segments' do
      expect(canvases.count).to be 4

      expect(canvases.first['name']).to eq 'ONBOARDING_NEW SUBSCRIBERS'
    end

    def canvases
      JSON.parse(list_canvas.body)['canvases']
    end
  end
end
