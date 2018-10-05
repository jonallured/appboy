require 'spec_helper'

# Force autoload.
Appboy::API

class API
  include Appboy::Endpoints::TriggerCampaign

  def app_group_id
    :app_group_id
  end
end

describe Appboy::Endpoints::TriggerCampaign do
  let(:api) { API.new }
  let(:trigger_campaign_service) { double(:trigger_campaign_service) }

  before { expect(api).to receive(:trigger_campaign_service).and_return(trigger_campaign_service) }

  describe '#trigger_campaign_service' do
    let(:payload) {{
      campaign_id: 1,
      external_user_id: "123",
      trigger_properties: {},
    }}

    subject(:trigger_campaign!) { api.trigger_campaign(payload) }

    it 'triggers campaign' do
      expect(trigger_campaign_service).to receive(:perform).with(:app_group_id, payload)

      trigger_campaign!
    end
  end
end
