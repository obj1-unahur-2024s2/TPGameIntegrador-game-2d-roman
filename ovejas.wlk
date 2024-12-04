import wollok.game.*
import personajes.*

class Oveja {

       var orientacion = up

       var property position = game.origin()

       method image() = "Oveja" + orientacion.descripcion() + ".png"

       method accion(unaVelocidad) {

              game.onTick(unaVelocidad,"Oveja",{self.desplazarse()})

       }

       method esCoyote() {

              return false

       }
       
       method esCorreCaminos() = false

       method esOveja() = true

       method milagroso() {
              
              const probabilidades = talvez.seaCierto(50)

              return probabilidades
              
       }

       method envenenado() = false

       method morir() {
              
              game.removeVisual(self)

       }

       method desplazarse() {
 
              self.avanzar()

             if  (self.llego()) {

                  self.girar()

                 }
            
       }

       method avanzar() {
		   
	        position = orientacion.adelante(position)

	}


    method llego() {
           
               return orientacion.enElBorde(position)
           
    }


    method girar() {
           
               orientacion = orientacion.siguiente()

    }

}

class OvejaAleatoria inherits Oveja {

      override method llego() = talvez.seaCierto(10) or super()

}

class OvejaLoca inherits Oveja {
      
      override method avanzar() {
      
        position = orientacion.adelante(position)

        super()

      } 
}

class OvejaRebotadora inherits Oveja {
     
      override method girar() {

      orientacion = orientacion.opuesto()

      }

      override method envenenado() {
             
             return false

      }


}

class OvejaRebotadoraEnvenenada inherits OvejaRebotadora {
      

      override method envenenado() {
             
             const probabilidades = 0.randomUpTo(1)
             
             return probabilidades > 0.5

      }


     override method milagroso() {
              
              return false

     } 

     override method image() = "OvejaEspecial" + orientacion.descripcion() + ".png"


     override method morir() {

             game.removeVisual(self)
             
             const probabilidades = 0.randomUpTo(3)
             
             if (probabilidades < 1) {

                 game.addVisual(ovejaRebotadoraEnvenenada10)

             }

            else if (probabilidades > 1 and probabilidades < 2) {
                 
                 game.addVisual(ovejaRebotadoraEnvenenada10)
                 game.addVisual(ovejaRebotadoraEnvenenada11)

            } 

            else {
                 
                 game.addVisual(ovejaRebotadoraEnvenenada10)
                 game.addVisual(ovejaRebotadoraEnvenenada11)
                 game.addVisual(ovejaRebotadoraEnvenenada12)

            }

     }
                       
}

class OvejaPausada inherits Oveja {

      var property probabilidad = 50

      override method avanzar() {

            if (talvez.seaCierto(probabilidad)) {
                
                super()

            }

    }
}
class OvejaDiagonal inherits Oveja {

      override method avanzar() {

               super()

               position = orientacion.siguiente().adelante(position)

      }

     override method llego() = super() or orientacion.siguiente().enElBorde(position)
     

     override method girar() {

              super()

              if (orientacion.enElBorde(position)) {
                  super()
                  super()
             }
       }

      override method envenenado() = false
}


class OvejaDiagonalEnvenenada inherits OvejaDiagonal {
      
       override method envenenado() {
             
             const probabilidades = 0.randomUpTo(1)
             
             return probabilidades > 0.5

      }


     override method milagroso() {
              
              return false

     } 

     override method image() = "OvejaEspecial" + orientacion.descripcion() + ".png"

}

object granja {
       
       const property position = game.at(5,5)

       method image() {
              
              return "granja.png"

       } 

       method esCoyote() {
             
             return false

      }

      method esCorreCaminos() = false

      method esOveja() = false


}

object up {
       
       method descripcion() = "U"
       
       method siguiente() = right

       method opuesto() = down

       method adelante(position) = position.up(1)

       method enElBorde(position) = position.y() >= game.height() - 3

}

object right {

       method descripcion() = "R"

       method siguiente() = down

       method opuesto() = left

       method adelante(position) = position.right(1)

       method enElBorde(position) = position.x() >= game.width() -3

}

object down {
       
       method descripcion() = "D"

       method siguiente() = left

       method opuesto() = up

       method adelante(position) = position.down(1)

       method enElBorde(position) = position.y() <= 0

}


object left {
       
       method descripcion() = "L"

       method siguiente () = up
       
       method opuesto() = right

       method adelante(position) = position.left(1)

       method enElBorde(position) = position.x() <= 0

}

const ovejaRebotadora1 = new OvejaRebotadora(position = game.at(6,2))
const ovejaRebotadora2 = new OvejaRebotadora(position = game.at(8,5))
const ovejaRebotadora3 = new OvejaRebotadora(position = game.at(10,8))
const ovejaRebotadora4 = new OvejaRebotadora(position = game.at(12,11))
const ovejaRebotadora5 = new OvejaRebotadora(position = game.at(14,14))
const ovejaRebotadora6 = new OvejaRebotadora(position = game.at(16,17))
const ovejaRebotadora7 = new OvejaRebotadora(position = game.at(18,20))
const ovejaRebotadora8 = new OvejaRebotadora(position = game.at(20,23))
const ovejaRebotadora9 = new OvejaRebotadora(position = game.at(22,6))
const ovejaRebotadora10 = new OvejaRebotadora(position = game.at(24,9))
const ovejaRebotadora11 = new OvejaRebotadora(position = game.at(24,12))
const ovejaRebotadora12 = new OvejaRebotadora(position = game.at(21,16))

const ovejaDiagonal1 = new OvejaDiagonal(position = game.at(5,7))
const ovejaDiagonal2 = new OvejaDiagonal(position = game.at(25,25))
const ovejaDiagonal3 = new OvejaDiagonal(position = game.at(0,25))
const ovejaDiagonal4 = new OvejaDiagonal(position = game.at(25,0))
const ovejaDiagonal5 = new OvejaDiagonal(position = game.at(0,2))
const ovejaDiagonal6 = new OvejaDiagonal(position = game.at(23,22))
const ovejaDiagonal7 = new OvejaDiagonal(position = game.at(2,23))
const ovejaDiagonal8 = new OvejaDiagonal(position = game.at(20,5))
const ovejaDiagonal9 = new OvejaDiagonal(position = game.at(10,15))
const ovejaDiagonal10 = new OvejaDiagonal(position = game.at(8,13))
const ovejaDiagonal11 = new OvejaDiagonal(position = game.at(19,4))
const ovejaDiagonal12 = new OvejaDiagonal(position = game.at(17,18))

const ovejaDiagonalEnvenenada1 = new OvejaDiagonalEnvenenada(position = game.at(12,12))
const ovejaDiagonalEnvenenada2 = new OvejaDiagonalEnvenenada(position = game.at(14,14))
const ovejaDiagonalEnvenenada3 = new OvejaDiagonalEnvenenada(position = game.at(16,16))
const ovejaDiagonalEnvenenada4 = new OvejaDiagonalEnvenenada(position = game.at(18,18))
const ovejaDiagonalEnvenenada5 = new OvejaDiagonalEnvenenada(position = game.at(13,15))
const ovejaDiagonalEnvenenada6 = new OvejaDiagonalEnvenenada(position = game.at(11,9))
const ovejaDiagonalEnvenenada7 = new OvejaDiagonalEnvenenada(position = game.at(9,7))
const ovejaDiagonalEnvenenada8 = new OvejaDiagonalEnvenenada(position = game.at(15,17))
const ovejaDiagonalEnvenenada9 = new OvejaDiagonalEnvenenada(position = game.at(14,20))
const ovejaDiagonalEnvenenada10 = new OvejaDiagonalEnvenenada(position = game.at(13,18))
const ovejaDiagonalEnvenenada11 = new OvejaDiagonalEnvenenada(position = game.at(12,10))
const ovejaDiagonalEnvenenada12 = new OvejaDiagonalEnvenenada(position = game.at(17,14))

const ovejaRebotadoraEnvenenada1 = new OvejaRebotadoraEnvenenada(position = game.at(12,12))
const ovejaRebotadoraEnvenenada2 = new OvejaRebotadoraEnvenenada(position = game.at(6,18))
const ovejaRebotadoraEnvenenada3 = new OvejaRebotadoraEnvenenada(position = game.at(8,20))
const ovejaRebotadoraEnvenenada4 = new OvejaRebotadoraEnvenenada(position = game.at(15,5))
const ovejaRebotadoraEnvenenada5 = new OvejaRebotadoraEnvenenada(position = game.at(20,10))
const ovejaRebotadoraEnvenenada6 = new OvejaRebotadoraEnvenenada(position = game.at(5,5))
const ovejaRebotadoraEnvenenada7 = new OvejaRebotadoraEnvenenada(position = game.at(10,18))
const ovejaRebotadoraEnvenenada8 = new OvejaRebotadoraEnvenenada(position = game.at(23,12))
const ovejaRebotadoraEnvenenada9 = new OvejaRebotadoraEnvenenada(position = game.at(18,25))
const ovejaRebotadoraEnvenenada10 = new OvejaRebotadoraEnvenenada(position = game.at(25,3))
const ovejaRebotadoraEnvenenada11 = new OvejaRebotadoraEnvenenada(position = game.at(7,22))
const ovejaRebotadoraEnvenenada12 = new OvejaRebotadoraEnvenenada(position = game.at(19,17))


