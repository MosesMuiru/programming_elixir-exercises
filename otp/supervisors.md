## this are notes on supervision

- they are used to maintain the health state of our application

under mix.exs
mod : {
    application.name, [define the initialization of you server]
}

the #initilized value will act as the initial_number in the supervisor

# mod:
-> tells the app that this is the main entry point for out app
our kickoff will go here

# registered: 
-> lists the names our application will register

# env :
used to initialize a environment variable
it is accessed through # get_env #
example

<!-- definging the application -->
under mix.exs
def application do

    [
        env: [initial_number: 234]
    ]
end

<!-- getting the env  -->

def Getting do
use Application
def start(_type, _args) do
    Get.start_link(Application.get_env(:sequence, :initial_number))


end