# == Schema Information
#
# Table name: holidays
#
#  id         :bigint(8)        not null, primary key
#  day        :date
#  kind       :integer          default("custom")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Holiday < ApplicationRecord
    extend Enumerize
  
    validates :day, presence: true
    validate :check_day_is_sunday
  
    enumerize :kind, in: { custom: 0, non_working_sunday: 1 }
  
    def self.present_on?(day)
      Holiday.any? { |holiday| holiday.day == day.to_date }
    end
  
    private
  
    def check_day_is_sunday
      errors.add(:day, :invalid) unless day.sunday?
    end
  end
