class Route < ApplicationRecord
  belongs_to :journey

  belongs_to :init_location, :class_name => 'Location'
  belongs_to :end_location, :class_name => 'Location'

  accepts_nested_attributes_for :init_location, reject_if: :all_blank, allow_destroy: true  
  accepts_nested_attributes_for :end_location, reject_if: :all_blank, allow_destroy: true  
end
