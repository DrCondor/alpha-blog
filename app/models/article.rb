# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Article < ApplicationRecord
validates :title, presence: true, length: { minimum: 3, maximum: 50 }
validates :description, presence: true, length: { minimum: 15, maximum: 300 }

end
