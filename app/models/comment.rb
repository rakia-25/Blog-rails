class Comment < ApplicationRecord
  belongs_to :article

  enum :status, {accepted:0, rejected:1, archived:2 },default:1

  validates :author, presence: true,length: { minimum: 3 }
  validates :content, presence: true,length: { minimum: 5 }
end
