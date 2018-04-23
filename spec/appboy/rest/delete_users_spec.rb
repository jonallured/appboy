require 'spec_helper'

describe Appboy::REST::DeleteUsers do
  let(:http) { double(:http) }

  let(:payload) {{
    external_ids: :external_ids,
    appboy_ids: :appboy_ids
  }}

  let(:app_group_id) { :app_group_id }

  subject { described_class.new(:app_group_id, external_ids: :external_ids, appboy_ids: :appboy_ids) }

  before { subject.http = http }

  it 'makes an http call to the track user endpoint' do
    expect(http).to receive(:post).with '/users/delete',
        payload.merge({ app_group_id: :app_group_id })

    subject.perform
  end
end
