defmodule Orders do
  @orders [
    [id: 123, ship_to: :NC, net_amount: 100.00],
    # ... other orders
  ]

  @tax_rates [NC: 0.075, TX: 0.08]

  def all_orders(@orders, @tax_rates) do
    # Make a copy of the orders list to avoid modifying the original
    orders_copy = Enum.map(@orders, & &1)

    for order in orders_copy do
      ship_to = order[:ship_to]
      order[:tax_rate] = @tax_rates[ship_to] || 0.0  # Set tax rate based on ship_to state
      order[:total_amount] = order[:net_amount] * (1 + order[:tax_rate])
    end

    orders_copy
  end
end
