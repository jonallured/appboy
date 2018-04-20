require 'spec_helper'

describe Appboy::REST::EmailUnsubscribes do
  let(:http) { double(:http) }

  before { subject.http = http }

  context "email provided" do
    subject { described_class.new(:app_group_id, email: :email) }

    it 'makes an http call to the email unsubscribes endpoint' do
      expect(http).to receive(:get).with '/email/unsubscribes', {
        app_group_id: :app_group_id,
        email: :email,
      }

      subject.perform
    end
  end

  context "dates provided" do
    subject { described_class.new(:app_group_id, start_date: :start_date, end_date: :end_date) }

    it 'makes an http call to the email unsubscribes endpoint' do
      expect(http).to receive(:get).with '/email/unsubscribes', {
        app_group_id: :app_group_id,
        start_date: :start_date,
        end_date: :end_date,
      }

      subject.perform
    end
  end

  context "limit and offset provided" do
    subject { described_class.new(:app_group_id, limit: :limit, offset: :offset) }

    it 'makes an http call to the email unsubscribes endpoint' do
      expect(http).to receive(:get).with '/email/unsubscribes', {
        app_group_id: :app_group_id,
        limit: :limit,
        offset: :offset,
      }

      subject.perform
    end
  end
end
