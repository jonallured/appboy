# Appboy

A wrapper for the Appboy REST API.

## Installation

Add this line to your application's Gemfile:

    gem 'appboy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install appboy

## Examples

### Initializing API

```ruby
api = Appboy::API.new('<app-group-id>')
```

By default Appboy will be using 'https://api.appboy.com' as the default REST API base url, but you can override this base url by setting the env variable `APPBOY_REST_BASE_URL`. E.G.

```
APPBOY_REST_BASE_URL="https://rest.iad-01.braze.com"
```

### Track User Attributes

See: [User Attributes Object Specification](https://www.braze.com/documentation/REST_API/#user-attributes-object-specification)

```ruby
api.track_users(attributes: [{
  external_id: 123,
  first_name: 'John',
  last_name: 'Smith',
  gender: 'male',
  email: 'jsmith@example.com'
}])
```

##### Track Attributes for Single User

```ruby
api.track_attribute(external_id: 123, first_name: 'John', ...)
```

### Track Event

See: [Event Object Specification](https://www.braze.com/documentation/REST_API/#event-object-specification)

```ruby
api.track_users(events: [{
  external_id: 123,
  name: 'add-to-cart',
  time: Time.now
}])
```

##### Track Events for Single User

```ruby
api.track_event(external_id: 123, name: 'Event', ...)
```

### Track Purchase

See: [Purchase Object Specfication](https://www.braze.com/documentation/REST_API/#purchase-object-specification)

```ruby
api.track_users(purchases: [{
  external_id: 123,
  product_id: 456,
  currency: 'CAD',
  price: 1.99,
  time: Time.now
}])
```

##### Track Purchases for Single User

```ruby
api.track_purchase(external_id: 123, product_id: 456, ...)
```

### Track Everything for Everyone All at Once

```ruby
api.track_users(purchases: purchases, events: events, attributes: attributes)
```

### Send Message

See: [Platform Push Object Specifications](https://www.braze.com/documentation/REST_API/#messaging)

##### Messages Payload

```ruby
messages = {
  android_push: { alert: 'Hello Android' },
  apple_push:   { alert: "Hello iOS" }
}
```

##### Option A, Using External User IDs

```ruby
api.send_messages(messages: messages, external_user_ids: [123, 456])
```

##### Option B, Using Segment ID

```ruby
api.send_messages(messages: messages, segment_id: '<segment-id>')
```

### Triggered Delivery Messages

See: [Sending Messages via API Triggered Delivery](https://www.braze.com/documentation/REST_API/#sending-messages-via-api-triggered-delivery)

##### Option A, Using Campaign ID
```ruby
api.trigger_campaign(
  api_key: (required, string),
  campaign_id: (required, string),
  send_id: (optional, string),
  audience: (optional, string),
  trigger_properties: (optional, object),
  broadcast: (optional, boolean, default, false),
  recipients: (optional, array of recipient objects)
)
```

##### Option B, Using Canvas ID

```ruby
api.send_canvas_triggered_messages(
  api_key: (required, string),
  campaign_id: (required, string),
  audience: (optional, string),
  canvas_entry_properties: (optional, object),
  broadcast: (optional, boolean, default, false),
  recipients: (optional, array of recipient objects)
)
```

### Schedule Message

See: [Platform Push Object Specifications](https://www.braze.com/documentation/REST_API/#schedule-api-triggered-campaigns-and-canvases)

```ruby
api.schedule_messages(send_at: 1.hour.since, messages: messages, segment_id: '<segment-id>')
```

### Changing Email Subscription

See: [Changing Email Subscription Status](https://www.braze.com/documentation/REST_API/#email-sync)

```ruby
api.email_status(email: 'john@example.com', status: :opted_in)
```

### List Segments

See: [Segment Export](https://www.braze.com/documentation/REST_API/#segment-export)

```ruby
api.list_segments
```

### Export Users

See: [User Export](https://www.braze.com/documentation/REST_API/#user-export)

#### By IDs

```ruby
api.export_users(external_ids: [1])
```

#### By Segment

```ruby
api.export_users(segment_id: segment_id, callback_endpoint: 'https://example.com')
```

## Debugging

The APPBOY_DEBUG environment variable will trigger full printouts of the Faraday gem's HTTP requests and responses.

```bash
cd /my/app
export APPBOY_DEBUG=true
bundle exec rails whatever
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
