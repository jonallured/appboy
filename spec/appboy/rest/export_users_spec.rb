require 'spec_helper'

describe Appboy::REST::ExportUsers do
  let(:payload) {{ external_ids: :external_ids }}
  let(:response) { double(body: { users: [build(:user)] }.to_json) }

  before { allow(http).to receive(:post).and_return(response) }

  it 'makes an http call to the track user endpoint' do
    expect(http).to receive(:post).with *arguments

    client.perform payload
  end

  def arguments
    ['/users/export/ids', payload.merge({ app_group_id: :app_group_id })]
  end
end
