class Route < ApplicationRecord
  belongs_to :journey

  belongs_to :init_location, :class_name => 'Location', optional: true
  belongs_to :end_location, :class_name => 'Location', optional: true

  accepts_nested_attributes_for :init_location, allow_destroy: true, reject_if:  ->(attrs) { attrs['address'].blank?}
  accepts_nested_attributes_for :end_location, allow_destroy: true, reject_if:  ->(attrs) { attrs['address'].blank?}  
end
