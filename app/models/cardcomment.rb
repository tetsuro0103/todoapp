class Cardcomment < ApplicationRecord
  belongs_to :task

  def has_avatar?(cardcomment)
    cardcomment.find(params[:user_id])
  end
end
