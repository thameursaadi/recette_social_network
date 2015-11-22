class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :pictures
	has_and_belongs_to_many :ingredients
	has_many :rates
end
