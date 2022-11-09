require_relative './base_decorator'
class CapitalizeDecorator < BaseDecorator
  def correct_name
    name = super()
    name.capitalize
  end
end
