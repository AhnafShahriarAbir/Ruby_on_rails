class Coordinator < ApplicationRecord
	belongs_to :course, dependent: :destroy
end
