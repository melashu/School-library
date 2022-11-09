require_relative './base_decorator'
class TrimmerDecorator < BaseDecorator
  def correct_name
    name = super()
    return unless name.size > 10

    name[0..9]
  end
end
