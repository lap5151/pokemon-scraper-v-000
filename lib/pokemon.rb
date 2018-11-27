require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name: "Pikachu", type: "electric", db: )
    @id = id
    @name = name
    @type = type
    #@hp = hp
    @db = db
  end

  def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id,db)
    new_pokemon = db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: new_pokemon[3])
  end

  def alter_hp(hp, db)
    db.execute( "UPDATE pokemon SET hp = ? WHERE id = ?", [hp, self.id])
    self.hp = hp 
    #binding.pry
  end




end
