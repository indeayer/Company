class CreateCompanyFacebooks < ActiveRecord::Migration
  def change
    create_table :company_facebooks do |t|
      t.integer :fid
      t.string :company_name
      t.string :f_url
      t.string :f_likes
      t.string :company_description

      t.timestamps
    end
  end
end
