class CreateAnalyticsUrlClicks < ActiveRecord::Migration[8.0]
  def change
    create_table :analytics_url_clicks do |t|
      t.references :shortened_url_mapping, null: false, foreign_key: true

      t.string :ipv4_address, limit: 16, null: false
      t.string :user_agent, limit: 256, null: false
      t.json :other_device_data_json

      t.timestamps
    end
  end
end
