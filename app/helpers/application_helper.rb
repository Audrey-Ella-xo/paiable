# frozen_string_literal: true

module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Paiable'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def namer(page_name = '')
    page_name unless page_name.empty?
  end
end
