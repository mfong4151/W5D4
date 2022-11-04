# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  short_url  :string           not null
#  long_url   :string           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :short_url, uniqueness: true
    validates :long_url, presence: true

    belongs_to (
        :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
    )

    after_initialize :generate_short_url, if: :new_record?

    def self.random_code
        code = SecureRandom.urlsafe_base64
    end

    private
    def generate_short_url

    end
end
