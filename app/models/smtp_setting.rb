# == Schema Information
#
# Table name: smtp_settings
#
#  id                       :integer          not null, primary key
#  account_id               :integer
#  from_email               :string
#  reply_to                 :string
#  provider                 :string
#  address                  :string
#  port                     :string
#  domain                   :string
#  username                 :string
#  password                 :string
#  is_default_for_campaigns :boolean          default("false")
#  is_default_for_reply     :boolean          default("false")
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class SmtpSetting < ApplicationRecord
  belongs_to :account

  def all_present?
    from_email.present? && address.present? && port.present? &&
    domain.present? && username.present? && password.present?
  end

  def self.default_for_campaigns
    where(is_default_for_campaigns: true).first
  end

  def self.default_for_reply
    where(is_default_for_reply: true).first
  end
end
