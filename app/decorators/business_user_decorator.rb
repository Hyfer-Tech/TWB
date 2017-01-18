class BusinessUserDecorator < UserDecorator
  delegate_all

  def description
    object.description.empty? ? "This user has no description." : object.description
  end
end
