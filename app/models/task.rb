class Task < ActiveRecord::Base
	validates :title,presence: true,uniqueness: true

	has_many :social_record
	has_many :user_task_intermediate
end
