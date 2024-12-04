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


object controlDeCazador {
      
       method config() {

              game.onCollideDo(cazador,{objeto =>
                      
                      if (objeto.esCoyote()) {

                          coyote.perderVidaOMorir()

                      }

                   })
       }

       
}

object controlDeCorrecaminos {

       method config() {

               game.onCollideDo(correcaminos,{objeto =>
                    
                      if (objeto.esCoyote()) {

                          correcaminos.morir()

                      }

               })

       }

}


object controlDeOvejas1 {

      method config() {
 

             game.onCollideDo(coyote,{objeto =>
             
                  if (objeto.esOveja()) {
                      
                      objeto.morir()

                  }

             })           
      }
}

object controlDeOvejas2 {

      method config() {
 

             game.onCollideDo(coyote,{objeto =>
             
                  if (objeto.esOveja()) {
                      
                      coyote.ganarOPerderVidaSegunAnimal(objeto)

                  }

             })           
      }
}

 object coyote {
    
    var property position = game.origin()
    var property direccion = "D"
    var property vida = 4
    const property cantidadDeCorazonesRojos = [corazonRojo,corazonRojo2,corazonRojo3,corazonRojo4]
    const property cantidadDeCorazonesNegros = [] 
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


    method esCoyote() {
           
           return true

    }

    method esCorreCaminos() = false

    method esOveja() = false   

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
           
           if (!self.sigueVivo()) {
               
               self.gameOver()

           }
    }

    method sigueVivo() {
          
           return self.cantidadDeCorazonesRojos() > 0 and self.vida() > 0

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
            
            if (unAnimal.envenenado() and self.sigueVivo()) {
                
                self.perder2Vidas()

            }

            else if (unAnimal.milagroso() and self.sigueVivo()) {
                     
                     if (self.tieneCorazonNegro()) {
                            
                            self.curarCorazonNegro()

                     }

                     else {
                          
                            self.sumarVidaSiPuede()
                            
                            self.sumarVidaSiPuede()

                     }

                    
            }


           else if (!unAnimal.milagroso() and self.sigueVivo()) {
                     
                    if (self.tieneCorazonNegro()) {
                        
                        self.curarCorazonNegro()

                    }


                    else {
                         
                        self.sumarVidaSiPuede() 

                    }

            }

     }

      
     method cantidadDeCorazonesRojos() {
            
            return cantidadDeCorazonesRojos.size()

     }


     method curarCorazonNegro() {
            
            if (self.tieneCorazonNegro(corazonNegro2)) {
                
                vida = vida + 1

                self.agregarCorazonRojo(corazonRojo2)
                
                self.sacarCorazonNegro(corazonNegro2)
                 
            }


           else if (self.tieneCorazonNegro(corazonNegro3)) {
                
                vida = vida + 1

                self.agregarCorazonRojo(corazonRojo3)

                self.sacarCorazonNegro(corazonNegro3)

           }


           
           else if (self.tieneCorazonNegro(corazonNegro4)) {

                vida = vida + 1
                
                self.agregarCorazonRojo(corazonRojo4)

                self.sacarCorazonNegro(corazonNegro4)

           }

           
           else if (self.tieneCorazonNegro(corazonNegro5)) {

                vida = vida + 1
                
                self.agregarCorazonRojo(corazonRojo5)

                self.sacarCorazonNegro(corazonNegro5)

           }

           
           else if (self.tieneCorazonNegro(corazonNegro6)) {

                vida = vida + 1
                
                self.agregarCorazonRojo(corazonRojo6)

                self.sacarCorazonNegro(corazonNegro6)

           }

           
           else if (self.tieneCorazonNegro(corazonNegro7)) {

                vida = vida + 1
                
                self.agregarCorazonRojo(corazonRojo7)

                self.sacarCorazonNegro(corazonNegro7)

           }

     }


     method tieneCorazonNegro() {
            
            return !cantidadDeCorazonesNegros.isEmpty()

     }

     method tieneCorazonNegro(unCorazonNegro) {
            
            return cantidadDeCorazonesNegros.contains(unCorazonNegro)

     }

     method agregarCorazonRojo(unCorazon) {
            
            game.addVisual(unCorazon)

            cantidadDeCorazonesRojos.add(unCorazon)

        }


     method sacarCorazonRojo(unCorazon) {
           
           game.removeVisual(unCorazon)

           cantidadDeCorazonesRojos.remove(unCorazon)

        }

       method agregarCorazonNegro(unCorazon) {
            
            game.addVisual(unCorazon)

            cantidadDeCorazonesNegros.add(unCorazon)

        }


     method sacarCorazonNegro(unCorazon) {
           
           game.removeVisual(unCorazon)

           cantidadDeCorazonesNegros.remove(unCorazon)

        }   

     
     method ganar2Vidas() {
            
            self.sumarVidaSiPuede()

            self.sumarVidaSiPuede()

     }

     method sumarVidaSiPuede() {
            
            if (self.cantidadDeCorazonesRojos() == 4 and !self.tieneCorazonNegro()) {
                
                vida = vida + 1

                self.agregarCorazonRojo(corazonRojo5)

            }


            else if (self.cantidadDeCorazonesRojos() == 5 and !self.tieneCorazonNegro()) {
                 
                 vida = vida + 1

                 self.agregarCorazonRojo(corazonRojo6)

            }


            else if (self.cantidadDeCorazonesRojos() == 6 and !self.tieneCorazonNegro()) {
                 
                 vida = vida + 1

                 self.agregarCorazonRojo(corazonRojo7)

            }

     }

     
     method perder2Vidas() {
            
            self.perderVida()

            self.perderVida()

     }

     method perderVida() {
            
            if (self.vida() == 7) {
                
                vida = vida - 1

                self.sacarCorazonRojo(corazonRojo7)

                self.agregarCorazonNegro(corazonNegro7) 

            }


           else if (self.vida() == 6) {

                vida = vida - 1
                
                self.sacarCorazonRojo(corazonRojo6)

                self.agregarCorazonNegro(corazonNegro6) 

           }

           else if (self.vida() == 5) {
                
                vida = vida - 1

                self.sacarCorazonRojo(corazonRojo5)

                self.agregarCorazonNegro(corazonNegro5) 


           } 

           else if (self.vida() == 4) {
                
                vida = vida - 1

                self.sacarCorazonRojo(corazonRojo4)

                self.agregarCorazonNegro(corazonNegro4) 
 
           } 
           
           else if (self.vida() == 3) {

                vida = vida - 1

                self.sacarCorazonRojo(corazonRojo3)
              
                self.agregarCorazonNegro(corazonNegro3) 
           } 

           else if (self.vida() == 2) {
                
                vida = vida - 1

                self.sacarCorazonRojo(corazonRojo2)
               
                self.agregarCorazonNegro(corazonNegro2) 
           }


           else if (self.vida() == 1) {
                
                vida = vida - 1

                self.sacarCorazonNegro(corazonRojo)
               
                self.agregarCorazonNegro(corazonNegro)

           }   

     }

     method gameOver() {

            game.clear()
            
            game.addVisual(coyotePerdio)

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

       const property position = game.at(9,15)

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
      
      method esOveja() = false
      
      method esCoyote() = false

      method esCorreCaminos() = false

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
