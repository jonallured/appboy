require 'spec_helper'

describe Appboy::REST::ListCanvas do
  let(:http) { double(:http) }

  let(:payload) {{
    sort_direction: "desc",
    include_archived: false
  }}

  let(:app_group_id) { :app_group_id }

  subject { described_class.new(:app_group_id, sort_direction: "desc", include_archived: false) }

  before { subject.http = http }

  it 'makes an http call to the list canvas endpoint' do
    expect(http).to receive(:get).with '/canvas/list',
        payload.merge({ app_group_id: :app_group_id })

    subject.perform
  end
end
