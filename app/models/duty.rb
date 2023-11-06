class Duty < ApplicationRecord
  belongs_to :assignment
  validates :name, presence: true,
            format: { with: /\A[^`!@#\$%\^&*+_=]+\z/,
                      message: 'Please enter a valid role name' },
            length: {
              minimum: 3,
              message: 'Role name is too short (minimum is 3 characters)'
            },
            uniqueness: { case_sensitive: false, scope: :assignment_id,
                          message: 'The role "%{value}" is already present for this assignment' }
  validates :max_members_for_duties, numericality: { only_integer: true, greater_than_or_equal_to: 1,
                                                   message: 'Value for max members for role is invalid' }
  # ensuring that when creating or updating a Duty instance, the name is present, follows specific character limitations, 
  # is of minimum length, and is unique within the scope of an assignment
end

