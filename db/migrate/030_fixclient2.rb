class Fixclient2 < ActiveRecord::Migration
  def self.up
    add_column :clients, :sname, :string
    add_column :clients, :address, :string
    add_column :clients, :town, :string
    add_column :clients, :post_code, :string
    add_column :clients, :mobile, :string
    add_column :clients, :landline, :string
    add_column :clients, :fr_fname, :string
    add_column :clients, :fr_sname, :string
    add_column :clients, :fr_number, :string
    add_column :clients, :gender_id, :integer
    add_column :clients, :dob, :date
    add_column :clients, :understoodconfidentiality, :boolean
    add_column :clients, :notes, :string

    add_column :clients, :rf_fname, :string
    add_column :clients, :rf_sname, :string
    add_column :clients, :rf_designation, :string
    add_column :clients, :rf_address, :string
    add_column :clients, :rf_town, :string
    add_column :clients, :rf_post_code, :string
    add_column :clients, :rf_number, :string
  end

  def self.down
    remove_column :clients, :sname, :string
    remove_column :clients, :address, :string
    remove_column :clients, :town, :string
    remove_column :clients, :post_code, :string
    remove_column :clients, :mobile, :string
    remove_column :clients, :landline, :string
    remove_column :clients, :fr_fname, :string
    remove_column :clients, :fr_sname, :string
    remove_column :clients, :fr_number, :string
    remove_column :clients, :gender_id, :integer
    remove_column :clients, :dob, :date
    remove_column :clients, :understoodconfidentiality, :boolean
    remove_column :clients, :notes, :string

    remove_column :clients, :rf_fname, :string
    remove_column :clients, :rf_sname, :string
    remove_column :clients, :rf_designation, :string
    remove_column :clients, :rf_address, :string
    remove_column :clients, :rf_town, :string
    remove_column :clients, :rf_post_code, :string
    remove_column :clients, :rf_number, :string
  end
end
