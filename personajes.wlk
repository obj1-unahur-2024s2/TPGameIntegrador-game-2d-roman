import sonido.*
import correcaminos.*
import wollok.game.*
import vidaPersonajes.*
import extra.*
import ovejas.*
import niveles.*

object config {
	   
	   method configurarTeclas() {
		   
		keyboard.w().onPressDo({if (game.height()-2 > coyote.position().y()) coyote.irA(coyote.position().up(1))})
              keyboard.a().onPressDo({if (game.width()-25 < coyote.position().x()) coyote.irA2(coyote.position().left(1),"I")})
              keyboard.s().onPressDo({if (game.height()-25 < coyote.position().y()) coyote.irA(coyote.position().down(1))})
              keyboard.d().onPressDo({if (game.width() -3 > coyote.position().x()) coyote.irA2(coyote.position().right(1),"D")})
              keyboard.l().onPressDo({game.stop()})
              keyboard.enter().onPressDo({game.say(coyote,coyote.mensaje())})

           }
}


object controlDeColisiones {
      
       method config() {
              game.onCollideDo(cazador,{coyote => coyote.perderVidaOMorir()})  
       }
       
}

object controlDeColisiones2 {

       method config() {
              game.onCollideDo(coyote,{correcaminos => correcaminos.morir()}) 
       }

}

object controlDeColisiones3 {

      method config(unAnimal) {
             game.onCollideDo(unAnimal,{coyote => coyote.ganarOPerderVidaSegunAnimal(unAnimal)})
             game.onCollideDo(unAnimal,{unAnimal => unAnimal.morir()})
      }

}

 object coyote {
    
    var property position = game.origin()
    var property direccion = "D"
    const cantidadDeCorazones = [corazonRojo,corazonRojo2,corazonRojo3,corazonRojo4,corazonRojo5,corazonRojo6,corazonRojo7] 
    var seMovio = false

    method image() {
           
           if (self.esPrimeraVez()) {
               
                  return "CoyoteAgachado.png"
           }

           else if (self.estaALaIzquierdaDe(correcaminos)) {
                   
                   return "coyoteAPuntoDeComerD.png" 

           }


           else if (self.estaALaDerechaDe(correcaminos)) {
                   
                   return "coyoteAPuntoDeComerI.png"

           }


           else {
                 
                  return "CoyoteCorriendo" + direccion + ".png"

           }
               
       }

    method mensaje() {
           
          const probabilidad = 0.randomUpTo(5)
           
          if (probabilidad >= 0 and probabilidad < 1) {
               
               return "Tengo Hambre"

           }

          else if (probabilidad >= 1 and probabilidad < 2 ) {
                  
                   return "Te voy a comer"

          }


          else if (probabilidad >= 2 and probabilidad < 3) {
                  
                  return "Hace mucho no como a un correcaminos"

          }


          else if (probabilidad >= 3 and probabilidad < 4) {
                  
                  return "Que lindo día para comer"

          }


         else {
                 
                 return "Estoy cansado de correr"

         } 


    }

    
    method mostrarMensaje(unTiempo) {
           
           game.schedule(10000,{self.mensaje()})

    }


    method esPrimeraVez() {
           
           return !seMovio
           
    }

    method irA(nuevaPosicion) {
           
           position = nuevaPosicion

           seMovio = true 

    }

    method irA2(nuevaPosicion,unaDireccion) {
           
           position = nuevaPosicion

           direccion = unaDireccion

           seMovio = true

    }

    method morir() {
           
           if (self.cantidadDeCorazones() == 0) {
               
               self.gameOver1()

           }
    }

    method sigueVivo() {
          
           return self.cantidadDeCorazones() > 0

    }

    method perderVidaOMorir() {
           
           if (self.sigueVivo()) {

               self.perderVida()  

           }

           else {

               self.morir()

           }

    }
     
    method ganarOPerderVidaSegunAnimal(unAnimal) {
            
            if (unAnimal.envenenado() and self.sigueVivo() and !unAnimal.esCorrecaminos()) {
                
                self.perder2Vidas()

            }


            else if (unAnimal.milagroso() and self.sigueVivo() and !unAnimal.esCorrecaminos()) {
                
                     if (self.faltanCurarDosCorazonesOMas()) {

                         self.curarCorazonNegro()

                         self.curarCorazonNegro()

                     }


                     else {

                          self.ganar2Vidas()

                     }

            }

            else if (self.sigueVivo() and !unAnimal.esCorrecaminos()) {
                   
                   self.sumarVidaSiPuede()

            }


            else {
                  
                  self.gameOver1()

            } 

     }

      
     method cantidadDeCorazones() {
            
            return cantidadDeCorazones.size()

     }

     method faltanCurarDosCorazonesOMas() {
            
            return cantidadDeCorazones.filter({corazon => corazon.color() == "Negro"}).size() > 2

     }
     
     method curarCorazonNegro() {
            
            if (self.tieneCorazonNegro() and self.encontrarCorazonNegro() == corazonNegro) {
                
                self.reemplazarCorazon(corazonNegro,corazonRojo)

            }

            else if (self.tieneCorazonNegro() and self.encontrarCorazonNegro() == corazonNegro2) {
                
                self.reemplazarCorazon(corazonNegro2,corazonRojo2)

            }

            else if (self.tieneCorazonNegro() and self.encontrarCorazonNegro() == corazonNegro3) {
                
                self.reemplazarCorazon(corazonNegro3,corazonRojo3)

            }

            else if (self.tieneCorazonNegro() and self.encontrarCorazonNegro() == corazonNegro4) {
                
                self.reemplazarCorazon(corazonNegro4,corazonRojo4)

            }

            else if (self.tieneCorazonNegro() and self.encontrarCorazonNegro() == corazonNegro5) {
                
                self.reemplazarCorazon(corazonNegro5,corazonRojo5)

            }


            else if (self.tieneCorazonNegro() and self.encontrarCorazonNegro() == corazonNegro6) {
                
                self.reemplazarCorazon(corazonNegro6,corazonRojo6)

            }

            else if (self.tieneCorazonNegro() and self.encontrarCorazonNegro() == corazonNegro7) {
                
                self.reemplazarCorazon(corazonNegro7,corazonRojo7)

            }

     }

     method encontrarCorazonNegro() {
            
            return cantidadDeCorazones.find({corazon => corazon.color() == "Negro" })

     }

     method tieneCorazonNegro() {
            
            return cantidadDeCorazones.any({corazon => corazon.color() == "Negro"})

     }

     method agregarCorazon(unCorazon) {
            
            game.addVisual(unCorazon)

            cantidadDeCorazones.add(unCorazon)

        }


     method sacarCorazon(unCorazon) {
           
           game.removeVisual(unCorazon)

           cantidadDeCorazones.remove(unCorazon)

    }

     method reemplazarCorazon(corazonAReemplazar,corazonAPoner) {
            
            game.removeVisual(corazonAReemplazar)

            cantidadDeCorazones.remove(corazonAReemplazar)

            game.addVisual(corazonAPoner)

            cantidadDeCorazones.add(corazonAPoner)
           
     }
     
     method ganar2Vidas() {
            
            self.sumarVidaSiPuede()

            self.sumarVidaSiPuede()

     }

     method sumarVidaSiPuede() {
            
            if (self.cantidadDeCorazones() == 4 and !self.tieneCorazonNegro()) {
                
                self.agregarCorazon(corazonRojo5)

            }


            else if (self.cantidadDeCorazones() == 5 and !self.tieneCorazonNegro()) {
                 
                 self.agregarCorazon(corazonRojo6)

            }


            else if (self.cantidadDeCorazones() == 6 and !self.tieneCorazonNegro()) {
                 
                 self.agregarCorazon(corazonRojo7)

            }

     }

     
     method perder2Vidas() {
            
            self.perderVida()

            self.perderVida()

     }

     method perderVida() {
            
            if (self.cantidadDeCorazones() == 7) {

                self.sacarCorazon(corazonRojo7)

                game.addVisual(corazonNegro7)

            }


           else if (self.cantidadDeCorazones() == 6) {
                
                self.sacarCorazon(corazonRojo6)

                game.addVisual(corazonNegro6)

           }

           else if (self.cantidadDeCorazones() == 5) {
                
                self.sacarCorazon(corazonRojo5)

                game.addVisual(corazonNegro5) 


           } 

           else if (self.cantidadDeCorazones() == 4) {
                
                self.sacarCorazon(corazonRojo4)

                game.addVisual(corazonNegro4) 
 
           } 

           else if (self.cantidadDeCorazones() == 3) {
                
                self.sacarCorazon(corazonRojo3)
              
                game.addVisual(corazonNegro3)
           } 

           else if (self.cantidadDeCorazones() == 2) {
                
                self.sacarCorazon(corazonRojo2)
               
                game.addVisual(corazonNegro2)
           }


           else if (self.cantidadDeCorazones() == 1) {
                
                self.sacarCorazon(corazonRojo)
               
                game.addVisual(corazonNegro)
           }   

     }

     method gameOver1() {
            
            agregarOvejas.quitarTodasLasOvejas()

            game.addVisual(coyotePerdio)

            game.removeVisual(self)

            game.removeVisual(cazador)

            game.removeVisual(correcaminos)

            game.addVisual(correCaminosGanador)

            game.addVisual(perdedor)

            game.addVisual(granja)

            correCaminosGanador.mensaje()

            correCaminosGanador.play()

            game.say(self,"¡You Lose!")

            game.stop()

     }


     method cazadorEstaEnLaMismaPosicion() {
            
            return cazador.position() == self.position()

     }

     method estaArribaDe(unAnimal) {
            
            return self.position().y() == unAnimal.position().y() + 1 

     }

     method estaDebajoDe(unAnimal) {

            return self.position().y() == unAnimal.position().y() - 1

     }

     method estaALaDerechaDe(unAnimal) {

            return self.unaPosicionALaDerechaEnX(unAnimal) and self.mismaPosicionEnY(unAnimal)
            
     }

     method estaALaIzquierdaDe(unAnimal) {

            return self.unaPosicionALaIzquierdaEnX(unAnimal) and self.mismaPosicionEnY(unAnimal)

     }

     method unaPosicionALaDerechaEnX(unAnimal) {
            
            return self.position().x() == unAnimal.position().x() + 3

     }

     method unaPosicionALaIzquierdaEnX(unAnimal) {
            
            return self.position().x() == unAnimal.position().x() - 3

     }
     

     method mismaPosicionEnY(unAnimal) {
            
            return self.position().y() == unAnimal.position().y()

     }

     method mismaPosicionEnX(unAnimal) {
            
            return self.position().x() == unAnimal.position().x()

     }

     method animalAComer(unAnimal) {
            
            return unAnimal.position()

     }

}

object coyotePerdio {

       const property position = game.at(10,16)

       method image() = "coyotePerdio.png" 

}


class Cazador {

      var property position = game.at(10,5)

      var dir = "ImagenInicial"

      var property seMovio = false

      method image() {
            
             if (dir == "ImagenInicial") {

                 return "cazadorBase.png"
                 
             }
             
             else if (dir == "Izq") {
                 
                 return "cazadorI.png"

             }

            else {
                
                return "cazadorD.png"

            } 

      }
      
      method esCorrecaminos() = false

      method empezarAPerseguir(velocidad) {
             
             game.schedule(5000,{self.caminar(velocidad)})

      }

      method caminar(velocidad) {
             
             game.schedule(3000,{game.say(self,"¡Ven aquí lobito!")})

             game.onTick(velocidad," perseguirPersonaje", {self.perseguirPersonaje()})

      }

      method perseguirPersonaje(){

             const ultimaDireccion = dir

             if (self.position() != coyote.position()) {
                 
                 position = self.perseguirEnDireccionY()

                 position = self.perseguirEnDireccionX()

                  
             if (coyote.position().x() > self.position().x()) {
                 
                      dir = "Der"

                 }

        
             else {

                     dir = "Izq"
                 
                 }

             } 

             

       }

       method esPrimeraVez() {
           
           return !seMovio
           
       }

       method perseguirEnDireccionY(){

             var mover = position

             if (coyote.position().y() > self.position().y()) {
                
                 mover = mover.up(1)

             }
           
             else if(coyote.position().y() < self.position().y()) {

                  mover = mover.down(1)

             }
           
           return mover
    }

    method perseguirEnDireccionX(){

           var mover = position

           if (coyote.position().x() > self.position().x()) {

                mover = mover.right(1)

           }
              
           else if(coyote.position().x() < self.position().x()) {
                
                mover = mover.left(1)

           }
           
           return mover
    } 
 

}

object talvez {

       method seaCierto(porcentaje) = 0.randomUpTo(1)*100 < porcentaje

}

const cazador = new Cazador()

