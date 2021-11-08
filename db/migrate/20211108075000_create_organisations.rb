class CreateOrganisations < ActiveRecord::Migration[6.1]
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :location
      t.references :user, null: false, foreign_key: true
      t.references :courses, null: false, foreign_key: true

      t.timestamps
    end
  end
end
