class Task < ActiveRecord::Base
	validates :title,presence: true,uniqueness: true

	#here try
	has_many :user_task_intermediate
end
