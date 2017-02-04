module Factory
  def build(type, override_attrs = {})
    case type
    when :attribute then attribute_attrs(override_attrs)
    when :event then event_attrs(override_attrs)
    when :purchase then purchase_attrs(override_attrs)
    when :messages then messages_attrs(override_attrs) 
    else {}
    end
  end

  private

  def attribute_attrs(override_attrs)
    { external_id: 1, foo: :bar }.merge(override_attrs)
  end

  def event_attrs(override_attrs)
    { external_id: 1, name: :baz, time: Time.now }.merge(override_attrs)
  end

  def purchase_attrs(override_attrs)
    {
      external_id: 1,
      product_id: 1,
      time: Time.now,
      currency: 'CAD',
      price: 1.0
    }.merge(override_attrs)
  end

  def messages_attrs(override_attrs)
    { apple_push: { alert: :hello } }.merge(override_attrs)
  end
end
