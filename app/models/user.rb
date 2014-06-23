class User < ActiveRecord::Base

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  before_save :downcase_email

  SHIRT_SIZES = ['none',
                 'S',
                 'M',
                 'L',
                 'XL',
                 'XXL',
                 'XXXL']

  def self.find_or_create_by_auth_hash(auth_hash)
    user = where(email: auth_hash['info']['email']).first_or_initialize

    user.uid = auth_hash['uid']
    user.provider = auth_hash['provider']
    user.name = auth_hash['info']['name']
    user.sign_in_count += 1
    user.last_sign_in_at = user.current_sign_in_at
    user.current_sign_in_at = Time.now

    user.save!
    user
  end

  def registered?
    !heard_about_by.nil? &&
      !first_time_attendee.nil? &&
      !shirt_size.nil? &&
      !attending.nil?
  end

  private

  def downcase_email
    self.email = email.downcase
  end

end
