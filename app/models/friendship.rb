class Friendship < ActiveRecord::Base
  belongs_to :user
  #Esta es la sintaxis para una relacion con un modelo que no existe, pero pertenece a una 
  #clase existente.
  belongs_to :friend, :class_name => 'User'
end
