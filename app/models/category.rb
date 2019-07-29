# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 25, minimum: 3 }
  validates_uniqueness_of :name
end
