class RemoveOrganisationidFromClassList < ActiveRecord::Migration[6.1]
  def change
    remove_column :class_lists, :organisation_id, :bigint
  end
end
