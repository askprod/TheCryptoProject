Rails.application.routes.draw do

  root 'crypto#home'
  post '/', to: 'crypto#find'
  get 'crypto/show'

end
