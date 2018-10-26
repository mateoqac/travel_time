class Route < ApplicationRecord
  belongs_to :journey
  validates :init_location, :end_location, presence: true
  
  has_one :init_location, :class_name => 'Location', :foreign_key => 'init_location_id'
  has_one :end_location, :class_name => 'Location', :foreign_key => 'end_location_id'

  accepts_nested_attributes_for :init_location, reject_if: :all_blank, allow_destroy: true  
  accepts_nested_attributes_for :end_location, reject_if: :all_blank, allow_destroy: true  
end
