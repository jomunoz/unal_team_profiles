class CreateJobPosts < ActiveRecord::Migration
  def change
    create_table :job_posts do |t|
      t.string :description
      t.text :full_profile
      t.string :source
      t.string :title
      t.string :industry
      t.string :location
      t.string :experience
      t.string :company

      t.timestamps
    end
  end
end
