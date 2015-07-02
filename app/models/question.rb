class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates_presence_of :title

  def click
  	self.increment! :countclick
  end

  def answerable
  	self.answers.where(accepted: true).blank?
  end
end
