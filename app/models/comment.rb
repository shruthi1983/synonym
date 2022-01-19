class Comment < ApplicationRecord
  belongs_to :synonym
  belongs_to :user,optional: true
end
