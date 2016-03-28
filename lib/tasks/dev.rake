namespace :dev do
  desc "建立10個使用者帳號"
  task :users => :environment do
    for i in 1..10 do
      u = User.create(
        email: "demo_user_#{i}@test.com",
        password: "12345678",
        password_confirmation: "12345678"
        )
    end
  end

end
