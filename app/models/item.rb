class Item < ActiveRecord::Base
	belongs_to :user
	has_many :wishes
	has_many :wishers, through: :wishes, source: :user
end
