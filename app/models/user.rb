class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def is_admin?
    is_admin
  end

  def to_admin
    update_columns(is_admin: true)
  end

  def to_normal
    self.update_columns(is_admin: false)
  end
end
