require 'spec_helper'

# Force autoload.
Appboy::API

class API
  include Appboy::Endpoints::CanvasDetails

  def app_group_id
    :app_group_id
  end
end

describe Appboy::Endpoints::CanvasDetails do
  let(:api) { API.new }
  let(:canvas_details_service) { double(:canvas_details_service) }

  before { expect(api).to receive(:canvas_details_service).and_return(canvas_details_service) }

  describe '#canvas_details_service' do
    let(:payload) {{
      canvas_id: 1,
    }}

    subject(:canvas_details!) { api.canvas_details(payload) }

    it 'triggers canvas' do
      expect(canvas_details_service).to receive(:perform).with(:app_group_id, payload)

      canvas_details!
    end
  end
end
