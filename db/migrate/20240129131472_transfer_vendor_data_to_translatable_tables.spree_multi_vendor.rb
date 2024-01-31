# This migration comes from spree_multi_vendor (originally 20231114093444)
class TransferVendorDataToTranslatableTables < ActiveRecord::Migration[6.1]
  TRANSLATION_MIGRATION = Spree::TranslationMigrations.new(Spree::Vendor, 'en')

  def up
    TRANSLATION_MIGRATION.transfer_translation_data
  end

  def down
    TRANSLATION_MIGRATION.revert_translation_data_transfer
  end
end
