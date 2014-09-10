class PersonalDatum < ActiveRecord::Base
	include PersonalDataHelper

	belongs_to :user
	
	before_save :uniqueness_personal,only: [:create]
	
	validates :nickname,      :uniqueness   => true
	validates :friend_number, :numericality => {only_integer: true}
	validates :login_password,:presence     => true,length: {minimum: 6}
	validates :phone_number , :presence     => true, numericality: {only_integer: true},length: {is: 11}
	
end
