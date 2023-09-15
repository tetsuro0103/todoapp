class Task < ApplicationRecord
  has_one_attached :eyecatch

  belongs_to :user

        def display_created_at
        I18n.l(self.created_at, format: :default)
    end

    def author_name
        user.display_name
    end
end
