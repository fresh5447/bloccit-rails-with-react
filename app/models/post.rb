class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :topic
	belongs_to :user

	validates :title, length: { minimum: 5 }, presence: true
	validates :body, length: { minimum: 20 }, presence: true
	validates :topic, presence: true
end
