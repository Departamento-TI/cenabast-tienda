class Spree::County < Spree::Base
  belongs_to :state, class_name: 'Spree::State'
  has_many :addresses, dependent: :nullify
  validates :name, presence: true

  self.whitelisted_ransackable_attributes = %w[state_id]

  def self.json_api_columns
    super + ['state_id']
  end
end
