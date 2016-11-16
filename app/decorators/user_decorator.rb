class UserDecorator < Draper::Decorator
  delegate_all

  def name
    "#{object.first_name} #{object.last_name}"
  end

  def description
    object.description.empty? ? "This user has not saved an introduction yet." : object.description
  end

  def address
    if object.address_line_2.present? && object.address_line_3.present?
      "#{object.address_line_1}, #{object.address_line_2}, #{object.address_line_3}"
    elsif object.address_line_2.present? && object.address_line_3.nil?
      "#{object.address_line_1}, #{object.address_line_2}"
    else
      "#{object.address_line_1}"
    end
  end

  def edit_link
    "#{object.class.name.underscore}s/edit"
  end

end
