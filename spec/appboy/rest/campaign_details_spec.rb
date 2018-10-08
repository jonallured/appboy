require 'spec_helper'

describe Appboy::REST::CampaignDetails do
  let(:http) { double(:http) }

  let :payload do
    {
      app_group_id: :app_group_id,
      campaign_id: :campaign_id,
    }
  end

  let(:app_group_id) { :app_group_id }

  subject do
    described_class.new
  end

  before { subject.http = http }

  it 'makes an HTTP call to the campaign details endpoint' do
    expect(http).to receive(:get).with('/campaigns/details', payload)

    subject.perform(
      app_group_id,
      campaign_id: :campaign_id,
    )
  end
end
