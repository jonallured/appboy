require 'spec_helper'

describe 'export users' do
  subject(:export_users) do
    api.export_users(external_ids: [1])
  end

  context 'with success', vcr: { cassette_name: 'export_users/successful' } do
    describe 'user' do
      subject(:user) { export_users.first }

      it 'has a first name' do
        expect(user.first_name).to eq 'John'
      end

      it 'has a last name' do
        expect(user.last_name).to eq 'Doe'
      end

      it 'has an email' do
        expect(user.email).to eq 'john@example.com'
      end

      it 'has a date of birth' do
        expect(user.dob.year).to be 1980
        expect(user.dob.month).to be 1
        expect(user.dob.day).to be 1
      end

      it 'has a country code' do
        expect(user.country).to eq 'CA'
      end

      it 'has a language code' do
        expect(user.language).to eq 'en'
      end

      it 'has a gender symbol' do
        expect(user.gender).to eq 'M'
      end

      it 'has a push subscribe value' do
        expect(user.push_subscribe).to eq 'opted_in'
      end

      it 'has a email subscribe value' do
        expect(user.email_subscribe).to eq 'subscribed'
      end

      it 'has a total revenue' do
        expect(user.total_revenue).to eq 10.0
      end

      it 'has devices used' do
        expect(user.devices.count).to be 1
      end

      it 'has apps installed' do
        expect(user.apps.count).to be 1
      end

      it 'has custom events triggered' do
        expect(user.custom_events.count).to be 1
      end

      it 'has purchases made' do
        expect(user.purchases.count).to be 2
      end

      it 'has cards user clicked' do
        expect(user.cards_clicked.count).to be 1
      end


      it 'has campaigns received' do
        expect(user.campaigns_received.count).to be 1
      end

      it 'a custom attributes hash' do
        expect(user.custom_attributes).to eq 'Confirmed' => true,
          'Region' => 'Quebec, QC', 'Language' => 'fr'
      end
    end
  end

  context 'unauthorized' do

  end
end
