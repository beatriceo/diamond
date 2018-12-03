class Stone < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id' # could be owner_id instead of owner
end
