class CreateShortenedUrlMappings < ActiveRecord::Migration[8.0]
  def change
    create_table :shortenedUrlMappings do |t|
      t.string :target_url, limit: 1024, null: false
      t.string :short_code, limit: 8, null: false
      t.datetime :expires_at, null: false

      t.timestamps
    end
    add_index :shortenedUrlMappings, :short_code, unique: true
  end
end
