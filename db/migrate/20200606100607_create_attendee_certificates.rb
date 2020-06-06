class CreateAttendeeCertificates < ActiveRecord::Migration[6.0]
  def change
    create_table :attendee_certificates do |t|
      t.integer :attendee_id
      t.integer :certificate_id
      t.integer :sent

      t.timestamps
    end
  end
end
