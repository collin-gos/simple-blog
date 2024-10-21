after :common do
  users = [
    { email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: 1 },
    { email: 'user1@example.com', password: 'password', password_confirmation: 'password' },
    { email: 'user2@example.com', password: 'password', password_confirmation: 'password' }
  ]

  # Loop through and create users
  users.each do |user_attrs|
    User.find_or_create_by!(email: user_attrs[:email]) do |user|
      user.password = user_attrs[:password]
      user.password_confirmation = user_attrs[:password_confirmation]
      user.role = user_attrs[:role] if user_attrs.key?(:role)
    end
  end
end
