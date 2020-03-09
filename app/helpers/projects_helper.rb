# frozen_string_literal: true

module ProjectsHelper
  def total_int_to_time
    i = current_user.projects.sum(:worked_hours)
    ar = [0, 0]
    ar[0] = i / 60
    ar[1] = i % 60
    "#{ar[0]}:#{ar[1]}"
  end

  # def int_to_time
  #     i = current_user.projects.find_by(user_id: current_user.id).worked_hours
  #     ar = [0,0]
  #     ar[0] = i/60
  #     ar[1] = i%60
  #     int_to_time = "#{ar[0]}:#{ar[1]}"
  # end
end
