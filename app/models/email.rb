class Email < ActiveRecord::Base
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i },
                    uniqueness: true,
                    presence: true

  before_save :downcase

  private

  def downcase
    self.email = email.downcase
  end

end