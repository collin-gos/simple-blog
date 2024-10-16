class Comment < ApplicationRecord
  include Visible

  belongs_to :article

  validates :body, presence: true

  before_validation :ensure_commenter_has_value, on: :create

  private
    def ensure_commenter_has_value
      if commenter.blank?
        self.commenter = "Anonymous"
      end
    end
end
