class MigrateUserBehaviorToJointTable < ActiveRecord::Migration[7.0]
  def change
    first_user = User.create(
      email:"firstuser@sth",
      password:"changeme!",
      password_confirmation:"changeme!")
    
    Challenge.all.each do |c|
      c.user = first_user
      c.save
    end

    Activity.all.each do |a|
      a.user = first_user
      a.save
    end

  end
end
