class Device < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
