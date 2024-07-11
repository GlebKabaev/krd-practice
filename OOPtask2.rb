module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
    
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end

      if verb!='GET' or verb!='POST' or verb!='PUT' or verb!='DELETE' or verb!='q'
        puts 'wrong text' 
      else
        action.nil? ? routes[verb].call : routes[verb][action].call
      end
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    puts @posts
    puts 'index'
  end

  def show
    puts "give me index"
    i=gets.chomp.to_i
    puts @posts[i]
    puts 'show'
  end

  def create
    puts "give me a text"
    text=gets.chomp
    @posts<<{@posts.size=>text}
    puts @posts[@posts.size-1]
    puts 'create'
  end

  def update
    puts "give me index"
    i=gets.chomp.to_i
    puts "give me a text"
    text=gets.chomp
    @posts[i]={i=>text}
    puts 'update'
  end

  def destroy
    puts "give me index"
    i=gets.chomp.to_i
    @posts.delete_at(i-1)
    puts 'destroy'
  end

end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp

      PostsController.connection(@routes['posts']) if choise == '1'
      break if choise == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init