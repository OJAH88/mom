class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest, :name, :city, :state
end

