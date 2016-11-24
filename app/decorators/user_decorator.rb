class UserDecorator < Draper::Decorator
  delegate_all
  
  def original
    object
  end

  def name
    "#{object.first_name} #{object.last_name}"
  end

  def description
    object.description.nil? ? "This user has not saved an introduction yet." : object.description
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

  def user_type
    object.class
  end

  def user_type_name
    object.class.name.underscore
  end

  def edit_link
    "/#{object.class.name.underscore}s/edit"
  end

  def profile_link
    "/#{object.class.name.underscore}s/#{object.id}"
  end

  def destroy_session_path
    "/#{object.class.name.underscore}s/sign_out"
  end

end
