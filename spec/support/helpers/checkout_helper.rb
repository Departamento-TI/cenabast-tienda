module Helpers
  module CheckoutHelper
    def fill_checkout_form_field(label, value)
      # Find the input field based on the adjacent span tag value
      input_field = find(:xpath, "//span[text()='#{label} *']/following-sibling::input")

      # Fill the input field with your desired value
      input_field.set(value)
    end

    def select_checkout_form_field(label, value)
      # Find the input field based on the adjacent span tag value
      input_field = find(:xpath, "//span[text()='#{label} *']/following-sibling::select")

      # Fill the input field with your desired value
      input_field.select(value)
    end
  end
end
