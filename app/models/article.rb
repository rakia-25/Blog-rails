class Article < ApplicationRecord
    validates :titre, presence: true,length: { minimum: 3 }
    validates :contenu, presence: true,length: { minimum: 5}
    has_many :comments, dependent: :destroy
    enum :status, {draft:0, published:1, archived:2 },default:0
end
