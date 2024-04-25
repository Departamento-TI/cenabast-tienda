class EnsureChileStatesRequiredToFalse < ActiveRecord::Migration[7.1]
  def up
    return unless chile

    chile.update(states_required: false)
  end

  def down
    return unless chile

    chile.update(states_required: true)
  end

  private

  def chile
    @chile ||= Spree::Country.find_by(
      name: 'Chile',
      iso_name: 'CHILE',
      iso: 'CL',
      iso3: 'CHL',
      numcode: 152
    )
  end
end
