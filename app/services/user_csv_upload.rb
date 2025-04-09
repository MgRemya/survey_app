require 'csv'

class UserCsvUpload
  def self.call(file)
    created = 0
    skipped = 0

    CSV.foreach(file.path, headers: true) do |row|
      name  = row["name"] || row["Name"]
      email = row["email"] || row["Email"]

      next if User.exists?(email: email)

      password = SecureRandom.hex(4)

      user = User.new(name: name, email: email, password: password, role: "user")

      if user.save
        created += 1
        UserMailer.login_credentials(user, password).deliver_now
      else
        skipped += 1
      end
    end

    { created: created, skipped: skipped }
  end
end
