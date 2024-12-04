import wollok.game.*

class CorazonRojo {

      const property position 

      method image() = "nuevoCorazonRojo.png"

      method esCoyote() {
             
             return false

      }

      method esCorreCaminos() = false

      method esOveja() = false
    
}

class CorazonNegro {
      
      const property nivel  

      const property position

      method image() = "darkHeart.png"

      method esCoyote() {
             
             return false

      }

      method esCorreCaminos() = false

      method esOveja() = false



}

const corazonRojo = new CorazonRojo(position = game.at(1,23))

const corazonRojo2 = new CorazonRojo(position = game.at(3,23))

const corazonRojo3 = new CorazonRojo(position = game.at(5,23))

const corazonRojo4 = new CorazonRojo(position = game.at(7,23))

const corazonRojo5 = new CorazonRojo(position = game.at(9,23))

const corazonRojo6 = new CorazonRojo(position = game.at(11,23))

const corazonRojo7 = new CorazonRojo(position = game.at(13,23))

const corazonNegro = new CorazonNegro(position = game.at(1,23), nivel = "1")

const corazonNegro2 = new CorazonNegro(position = game.at(3,23), nivel = "2")

const corazonNegro3 = new CorazonNegro(position = game.at(5,23), nivel = "3")

const corazonNegro4 = new CorazonNegro(position = game.at(7,23), nivel = "4")

const corazonNegro5 = new CorazonNegro(position = game.at(9,23), nivel = "5")

const corazonNegro6 = new CorazonNegro(position = game.at(11,23), nivel = "6")

const corazonNegro7 = new CorazonNegro(position = game.at(13,23), nivel = "7")
