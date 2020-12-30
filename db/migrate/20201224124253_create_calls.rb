class CreateCalls < ActiveRecord::Migration[6.0]
  def change
    create_table :calls do |t|
      t.string :name
      t.string :call_to
      t.string :to_num
      t.string :twilio_id

      t.timestamps
    end
  end
end
