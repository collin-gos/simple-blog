module Visible
  extend ActiveSupport::Concern

  VALID_VISIBLE = [ "public", "private", "archived" ]

  included do
    validates :visible, inclusion: { in: Visible::VALID_VISIBLE }
  end

  def archived?
    visible == "archived"
  end
end
