class AddTypeToDefinition < ActiveRecord::Migration[6.1]
  def change
    add_column :definitions, :type, :string
  end
end
