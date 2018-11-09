class CreateCsvRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :csv_records do |t|
      t.string :name
      t.text :description
      t.datetime :record_date
      t.integer :record_id

      t.timestamps
    end
  end
end
