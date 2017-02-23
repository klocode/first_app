require 'active_record'
require_relative 'lipsum'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'development.sqlite3'
)

class ApplicationMigration < ActiveRecord::Migration
  def self.up
    create_table "lipsums", force: true do |t|
      t.text  "name"
      t.text  "body"
    end
    Lipsum.create(name: "Cheese", body: "<p>I love cheese, especially cow cheese slices. Cheese on toast halloumi cheesy feet cauliflower cheese cheesy grin hard cheese pecorino when the cheese comes out everybody's happy. Fromage macaroni cheese port-salut pecorino bocconcini melted cheese the big cheese parmesan.</p>")
    Lipsum.create(name: "Cupcake", body: "Candy biscuit chocolate bar cookie sesame snaps cake cookie toffee. Cookie dessert tootsie roll gummi bears. Chocolate bar soufflé pastry soufflé dessert. Muffin gingerbread fruitcake.")
    Lipsum.create(name: "Future", body: "<p>Marty, I'm sorry, but the only power source capable of generating one point twenty-one gigawatts of electricity is a bolt of lightning. Yeah I know, If you put your mind to it you could accomplish anything. I don't wanna know your name. I don't wanna know anything anything about you.</p>")
  end
end

begin ApplicationMigration.migrate(:up) end
