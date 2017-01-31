class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
    	t.references 	:movie, index: true
    	t.references	:user, index: true
    	t.text				:comment
      t.timestamps
    end
  end
end
