class CreateFakemodels < ActiveRecord::Migration[5.2]
  def change
    create_table :fakemodels do |t|

      t.timestamps
    end
  end
end
