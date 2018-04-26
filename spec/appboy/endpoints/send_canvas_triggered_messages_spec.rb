require 'spec_helper'
require 'appboy/endpoints/send_canvas_triggered_messages'

class API
  include Appboy::Endpoints::SendCanvasTriggeredMessages

  def app_group_id
    :api_key
  end
end

describe Appboy::Endpoints::SendCanvasTriggeredMessages do
  let(:api) { API.new }
  let(:performer) do
    instance_double "Appboy::REST::SendCanvasTriggeredMessages"
  end

  before do
    allow(api.send(:send_canvas_triggered_messages_service))
      .to receive(:new).and_return(performer)
    allow(performer).to receive(:perform).and_return true
  end

  describe '#send_canvas_triggered_messages_service', vcr: true do
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

    subject(:send_canvas_triggered_messages!) do
      api.send_canvas_triggered_messages(payload)
    end

    it 'sends a canvas message with recipients' do
      expect(api.send(:send_canvas_triggered_messages_service))
        .to receive(:new).with(:api_key, payload)

      send_canvas_triggered_messages!
    end
  end
end
