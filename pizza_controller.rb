require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza.rb')

#Index route
get('/pizzas') do
  @pizzas = Pizza.all()
  erb(:index)#by convention, the erb ref (view) should be the same as the REST action name
end

#New route
get('/pizzas/new') do
  erb(:new)
end

#Show route
get('/pizzas/:id') do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end

#Create
post('/pizzas') do
  @pizza = Pizza.new(params)
  @pizza.save()
  erb(:create)
end

#Delete
post('/pizzas/:id/delete') do
  id = params[:id]
  pizza = Pizza.find(id)
  pizza.delete()
  erb(:delete)
end

#Edit
get('/pizzas/:id/edit') do
  id = params[:id]
  @pizza = Pizza.find(id)
  erb(:edit)
end

#Update
post('/pizzas/:id') do
  @pizza = Pizza.new(params)
  @pizza.update()
  erb(:update)
end
