require 'spec_helper'

describe Appboy::REST::SendMessages do
  let(:payload) {{
    messages: :messages,
    external_user_ids: :external_user_ids,
    segment_ids: [:segment_id]
  }}

  before { subject.http = http }

  it 'makes an http call to the send messages endpoint' do
    expect(http).to receive(:post).with *arguments

    subject.perform messages: :messages, external_user_ids: :external_user_ids,
      segment_id: :segment_id
  end

  def arguments
    ['/messages/send', payload.merge({ app_group_id: :app_group_id })]
  end
end
