class Team < ApplicationRecord
  has_many :student_team, dependent: :destroy

  validates :name, presence: true

  belongs_to :user
end
