require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/pizza_order')
also_reload('./models/*')

# READ - all/index

get '/pizza_orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

# CREATE - new

get '/pizza_orders/new' do
  erb(:new)
end

# CREATE - CREATE

post '/pizza_orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

# READ - one/show

get '/pizza_orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

# UPDATE

get '/pizza_orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza_orders/:id' do
  @order = PizzaOrder.new(params)
  @order.update()
  redirect to '/pizza_orders'
end

# DELETE

post '/pizza_orders/:id/delete' do
  order = PizzaOrder.find(params[:id])
  order.delete()
  redirect to '/pizza_orders'
end
