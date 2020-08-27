class Task < ApplicationRecord
  belongs_to :project
  has_many :project, dependent: :destroy
  accepts_nested_attributes_for :project, :allow_destroy
end
