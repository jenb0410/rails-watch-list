class Bookmark < ApplicationRecord
  belongs_to :list_id
  belongs_to :movie_id
end
