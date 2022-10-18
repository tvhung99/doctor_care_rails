# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_paranoid
  belongs_to :role
  has_one :doctor, dependent: :destroy
  accepts_nested_attributes_for :doctor
  has_secure_password

  before_save :downcase_email
  before_create :create_confirmation_token

  PASSWORD_REGEXP = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])*[A-Za-z\d@$!%*?&]{8,}\z/
  PHONE_REGEX = /(((\+|)84)|0)([1-9])+([0-9]{8})/

  enum genders: [:male, :female, :not_sure, :prefer_not_to_disclose]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true , inclusion: { in: genders.keys }
  validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :password, presence: true, format: {with: PASSWORD_REGEXP}, confirmation: true
  validates_confirmation_of :password
  validates :phone_number, presence: true, format: {with: PHONE_REGEX}
  # validates :date_of_birth, presence: true, timeliness: { on_or_before: lambda { Date.current }, type: :date , after: "01/01/1900" }

  scope :exclude_supper_admin, -> { where.not(role_id: 1) }
  scope :doctor, -> { where(role_id: 4)}


  def create_reset_digest
    self.reset_token = User.new_token
    update_columns(reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now)
  end

  def confirm!
    update_columns confirmed_at: Time.current
    update_columns confirmation_token: nil
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def admin?
    normal_admin? || super_admin?
  end

  def doctor?
    role_id == 4
  end



  def confirmed?
    confirmed_at.present?
  end


  def normal_admin?
    role_id == 2
  end

  def super_admin?
    role_id == 1
  end

  private
  def downcase_email
    self.email = email.downcase
  end


  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def create_confirmation_token
    self.confirmation_token = User.digest(User.new_token)
    self.confirmation_send_at = Time.now.utc
  end
end
