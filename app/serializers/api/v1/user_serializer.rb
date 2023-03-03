class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_one :wallet
end
