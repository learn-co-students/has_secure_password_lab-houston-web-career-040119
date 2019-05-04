class PasswordsEqual < ActiveModel::Validator
  def validate(record)
    unless record.password_confirmation == nil
      unless record.password == record.password_confirmation
        record.errors.add :base, "Passwords must match"
      end
    end
  end
end


class User < ApplicationRecord
  
  def authenticate(passwd)
    if self.password == passwd
      self
    end
  end

  validates_with PasswordsEqual
end

