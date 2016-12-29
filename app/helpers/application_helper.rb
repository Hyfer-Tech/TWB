module ApplicationHelper
  def current_user
    current_broker || current_business_user || current_forward_freight || nil
  end

  def sortable(column, title = nil)
  	title ||= column.titleize
  	direction = column == sort_column && sort_direction == "DESC" ? "ASC" : "DESC"
  	link_to title, sort: column, direction: direction
  end
end
