require 'spec_helper'
require 'appboy/endpoints/trigger_canvas'

class API
  include Appboy::Endpoints::TriggerCanvas

  def api_key
    :api_key
  end
end

describe Appboy::Endpoints::TriggerCanvas do
  let(:api) { API.new }
  let(:performer) do
    instance_double "Appboy::REST::TriggerCanvas"
  end

  before do
    allow(api.send(:trigger_canvas_service))
      .to receive(:new).and_return(performer)
    allow(performer).to receive(:perform).and_return true
  end

  describe '#trigger_canvas_service', vcr: true do
    let(:payload) do
      {
        audience: :audience,
        broadcast: :broadcast,
        canvas_entry_properties: :canvas_entry_properties,
        canvas_id: :canvas_id,
        recipients: :recipients,
        send_id: :send_id
      }
    end

    subject(:trigger_canvas!) do
      api.trigger_canvas(payload)
    end

    it 'sends a canvas message with recipients' do
      expect(api.send(:trigger_canvas_service))
        .to receive(:new).with(:api_key, payload)

      trigger_canvas!
    end
  end
end
