nodes -- take it as a position we are in our network
to get the current node --- Node.self

naming nodes
iex --name nodename@moses.local

connecting between nodes
Node.connect :node_name

setting up a cookie
cookie --> this is a security key. any node that has that key is able to connect to that node 