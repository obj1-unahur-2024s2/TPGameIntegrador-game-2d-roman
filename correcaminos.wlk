import wollok.game.*
import personajes.*
import extra.*
import ovejas.*
import niveles.*

object correcaminos {
       
         var property position = game.at(22,0)
         
         var dirImagen = ""

         method play() {

                game.sound("mip.mp3").play()

              }

         method esCorreCaminos() = true 

         method esCoyote() = false

         method esOveja() = false   
         
         method morir() {
                
                game.clear()

                game.addVisual(granja)

                game.addVisual(correCaminosLose)

                game.addVisual(ganador)
               
                game.stop()

         }

         method image() {

            if (position == game.at(22,0))  {
                
               return "Correcaminos.png"

           }

           else if (dirImagen == "Der") {

               return "CorreCaminosCorriendoD.png"
           }


           else if (dirImagen == "R") {
               
               return "CorreCaminosCorriendoR.png"

           }

           
           else if (dirImagen == "L") {
               
               return "CorreCaminosCorriendoL.png"

           }


           else {

                return "CorreCaminosCorriendoI.png"

           }

           
    }

    method empezarAMover(velocidad) {
           
           self.play()

           game.schedule(3000,{self.escapar(velocidad)})

    }

    method escapar(velocidad) {

           game.onTick(velocidad,"escaparDeCoyote",{self.escaparDeCoyote()})

    }

    method escaparDeCoyote() {

           self.escaparEnCoordenadasXY() 

    }

     method escaparEnCoordenadasXY() {
            
            if (self.coyoteSeEncuentraArribaDerecha() and self.puedeMoverseEnOpuestoAlCoyoteAbajoIzquierda()) {
                
                const probabilidad = 0.randomUpTo(100)

                if (probabilidad < 33) {
                    
                    dirImagen = "Izq"

                    self.moverIzquierda()

                }

                else if (probabilidad < 66) {
                     
                     self.moverAbajo()
                     
                }

                else {
                     
                     dirImagen = "Izq"

                     self.moverDiagonalAbajoIzquierda()

                }

            }

            
            else if (self.coyoteSeEncuentraArribaIzquierda() and self.puedeMoverseEnDiagonalAbajoDerecha()) {
                     
                     const probabilidad = 0.randomUpTo(100)

                     if (probabilidad < 33) {
                         
                         dirImagen = "Der"

                         self.moverDerecha()

                     }


                     else if (probabilidad < 66) {

                          self.moverAbajo()

                     }


                     else {
                          
                          dirImagen = "Der"

                          self.moverDiagonalAbajoDerecha()

                     }

            }


            else if (self.coyoteSeEncuentraAbajoDerecha() and self.puedeMoverseEnDiagonalArribaIzquierda()) {
                     
                     const probabilidad = 0.randomUpTo(100)

                     if (probabilidad < 33) {
                         
                         dirImagen = "Izq"

                         self.moverIzquierda()

                     }


                     else if (probabilidad < 66) {
                         
                         self.moverArriba()

                     }

                     else {
                         
                         dirImagen = "Izq"

                         self.moverDiagonalArribaIzquierda()

                     }

            }


            else if (self.coyoteSeEncuentraAbajoIzquierda() and self.puedeMoverseEnDiagonalArribaDerecha()) {
                     
                     const probabilidad = 0.randomUpTo(100)

                     if (probabilidad < 33) {
                         
                         self.moverArriba()

                     }

                     else if (probabilidad < 66) {
                         
                         dirImagen = "Der"

                         self.moverDerecha()

                     }

                     else {
                         
                         dirImagen = "Der"

                         self.moverDiagonalArribaDerecha() 

                     }

            }


            else if (self.coyoteSeEncuentraEnMismaColumnaArriba() and self.puedeMoverseHaciaAbajoYEnDiagonales()) {
                     
                     const probabilidad = 0.randomUpTo(100) 

                     if (probabilidad < 20) {
                         
                         dirImagen = "Izq"

                         self.moverIzquierda()

                     }

                     else if (probabilidad < 40) {
                         
                         dirImagen = "Der"

                         self.moverDerecha()

                     }

                     else if (probabilidad < 60) {

                        dirImagen = "Izq"

                        self.moverDiagonalAbajoIzquierda()

                     }

                     
                     else if (probabilidad < 80) {
                        
                        dirImagen = "Der"

                        self.moverDiagonalAbajoDerecha()

                     }

                     else {
                         
                         self.moverAbajo()

                     }


            }


            else if (self.coyoteSeEncuentraEnMismaColumnaAbajo() and self.puedeMoverseHaciaArribaYEnDiagonales()) {
                     
                     const probabilidad = 0.randomUpTo(100)

                     if (probabilidad < 20) {

                         dirImagen = "Izq"

                         self.moverIzquierda()

                     }

                     else if (probabilidad < 40) {

                          dirImagen = "Der"

                          self.moverDerecha()

                     }

                     else if (probabilidad < 60) {

                           dirImagen = "Izq"
                           
                           self.moverDiagonalArribaIzquierda()

                     }

                     else if (probabilidad < 80) {

                           dirImagen = "Der"

                           self.moverDiagonalArribaDerecha()

                     }


                     else {

                           self.moverArriba()

                     }

            }


            else if (self.coyoteSeEncuentraEnMismaFilaIzquierda() and self.puedeMoverseHaciaDerechaYEnDiagonales()) {
                     
                     const probabilidad = 0.randomUpTo(100)

                     if (probabilidad < 20) {

                         self.moverArriba()

                     }


                     else if (probabilidad < 40) {

                           self.moverAbajo()

                     }


                     else if (probabilidad < 60) {

                           dirImagen = "Der"

                           self.moverDiagonalArribaDerecha()

                     }

                     else if (probabilidad < 80) {
                           
                           dirImagen = "Der"

                           self.moverDiagonalAbajoDerecha()

                     }

                     else {

                            self.moverDerecha()

                     }

            }


            else if (self.coyoteSeEncuentraEnMismaFilaDerecha() and self.puedeMoverseHaciaIzquierdaYEnDiagonales()) {
                    
                    const probabilidad = 0.randomUpTo(100)
                    
                    if (probabilidad < 20) {
                        
                        self.moverArriba()

                    }

                    else if (probabilidad < 40) {
                         
                         self.moverAbajo()

                    }


                    else if (probabilidad < 60) {
                         
                         dirImagen = "Izq"

                         self.moverDiagonalArribaIzquierda()

                    }


                    else if (probabilidad < 80) {
                         
                         dirImagen = "Izq"

                         self.moverDiagonalArribaIzquierda()

                    }

                    else {
                         
                         dirImagen = "Izq"
                         
                         self.moverIzquierda()

                    }

            }


            else if (self.esUnaEsquina() or self.esUnBorde()) {
                     
                     const probabilidad = 0.randomUpTo(13)

                     if (probabilidad < 1 ) {
                         
                         dirImagen = "R"

                         position = game.at(12,12)

                     }


                     else if (probabilidad >= 1 and probabilidad < 2) {
                         
                         dirImagen = "L"

                         position = game.at(4,20)
 
                     }

                      else if (probabilidad >= 2 and probabilidad < 3) {
                         
                         dirImagen = "R"

                         position = game.at(20,20)

                     }

                      else if (probabilidad >= 3 and probabilidad < 4) {
                         
                         dirImagen = "L"

                         position = game.at(4,12) 

                     }


                      else if (probabilidad >= 4 and probabilidad < 5) {
                          
                          dirImagen = "R"

                          position = game.at(20,12)

                     }


                      else if (probabilidad >= 5 and probabilidad < 6) {
                          
                          dirImagen = "L"

                          position = game.at(4,5)

                     }

                      else if (probabilidad >= 6 and probabilidad < 7) {
                          
                          dirImagen = "R"

                          position = game.at(20,5)

                     }

                      else if (probabilidad >= 7 and probabilidad < 8) {
                          
                          dirImagen = "L"

                          position = game.at(12,20)

                     }

                      else if (probabilidad >= 8 and probabilidad < 9) {
                          
                          dirImagen = "R"

                          position = game.at(12,5)

                     }

                      else if (probabilidad >= 9 and probabilidad < 10) {
                          
                          dirImagen = "L"

                          position = game.at(8,16)

                     }

                     else if (probabilidad >= 10 and probabilidad < 11) {
                          
                          dirImagen = "R"

                          position = game.at(8,8)  
                             
                     }

                     else if (probabilidad >= 11 and probabilidad < 12) {
                          
                          dirImagen = "L"

                          position = game.at(16,16)

                     }

                     else {
                          
                          dirImagen = "R"

                          position = game.at(16,8)

                     }

            }

     }

     method coyoteSeEncuentraArribaDerecha() {
            
            return self.esMasGrandeCoyoteEnX() and self.esMasGrandeCoyoteEnY()

     }

     method coyoteSeEncuentraAbajoIzquierda() {
            
            return self.esMasChicoCoyoteEnX() and self.esMasChicoCoyoteEnY()

     }

     
     method coyoteSeEncuentraAbajoDerecha() {
            
            return self.esMasGrandeCoyoteEnX() and self.esMasChicoCoyoteEnY()

     }


     method coyoteSeEncuentraArribaIzquierda() {
            
            return self.esMasChicoCoyoteEnX() and self.esMasGrandeCoyoteEnY()

     }

     method coyoteSeEncuentraEnMismaColumnaArriba() {
            
            return self.coyoteSeEncuentraEnMismaColumna() and self.esMasGrandeCoyoteEnY()

     }

     
     method coyoteSeEncuentraEnMismaColumnaAbajo() {
            
            return self.coyoteSeEncuentraEnMismaColumna() and self.esMasChicoCoyoteEnY()

     }


     method coyoteSeEncuentraEnMismaFilaDerecha() {
            
            return self.coyoteSeEncuentraEnMismaFila() and self.esMasGrandeCoyoteEnX()

     }

     method coyoteSeEncuentraEnMismaFilaIzquierda() {

            return self.coyoteSeEncuentraEnMismaFila() and self.esMasChicoCoyoteEnX()

     }  


     method coyoteSeEncuentraEnMismaColumna() {
            
            return coyote.position().x() == self.position().x()

     }
    
     method coyoteSeEncuentraEnMismaFila() {
            
            return coyote.position().y() == self.position().y()

     }

     method puedeMoverseHaciaArribaYEnDiagonales() {
            
            return self.puedeMoverseEnOpuestoAlCoyoteArribaIzquierda() and self.puedeMoverseEnOpuestoAlCoyoteArribaDerecha()

     }

     method puedeMoverseHaciaAbajoYEnDiagonales() {
            
            return self.puedeMoverseEnOpuestoAlCoyoteAbajoIzquierda() and self.puedeMoverseEnOpuestoAlCoyoteAbajoDerecha()

     }

     method puedeMoverseHaciaDerechaYEnDiagonales() {
            
            return self.puedeMoverseEnOpuestoAlCoyoteArribaDerecha() and self.puedeMoverseEnOpuestoAlCoyoteAbajoDerecha()

     }

     method puedeMoverseHaciaIzquierdaYEnDiagonales() {
            
            return self.puedeMoverseEnOpuestoAlCoyoteArribaIzquierda() and self.puedeMoverseEnOpuestoAlCoyoteAbajoIzquierda()

     }

     method puedeMoverseEnOpuestoAlCoyoteAbajoIzquierda() {
            
            return self.puedeMoverseEnDiagonalAbajoIzquierda() and self.puedeMoverIzquierda() and self.puedeMoverAbajo()

     }

     method puedeMoverseEnOpuestoAlCoyoteArribaDerecha() {
            
            return self.puedeMoverseEnDiagonalArribaDerecha() and self.puedeMoverArriba() and self.puedeMoverDerecha()

     }

     method puedeMoverseEnOpuestoAlCoyoteAbajoDerecha() {
            
            return self.puedeMoverseEnDiagonalAbajoDerecha() and self.puedeMoverAbajo() and self.puedeMoverDerecha()

     }

     method puedeMoverseEnOpuestoAlCoyoteArribaIzquierda() {
            
            return self.puedeMoverseEnDiagonalArribaIzquierda() and self.puedeMoverArriba() and self.puedeMoverIzquierda()
     }    
 
     method puedeMoverseEnDiagonalAbajoIzquierda() {
            
            return self.puedeMoverAbajo() and self.puedeMoverIzquierda()

     }

     method puedeMoverseEnDiagonalAbajoDerecha() {
            
            return self.puedeMoverAbajo() and self.puedeMoverDerecha()

     }


     method puedeMoverseEnDiagonalArribaIzquierda() {
            
            return self.puedeMoverArriba() and self.puedeMoverIzquierda()

     }


     method puedeMoverseEnDiagonalArribaDerecha() {
            
            return self.puedeMoverArriba() and self.puedeMoverDerecha()

     }


     method puedeMoverArriba() {
            
            return self.position().y() < game.height() - 2

     }
     
     method puedeMoverAbajo() {
            
            return self.position().y() > 0

     }

     method puedeMoverIzquierda() {
            
            return self.position().x() > 0
     }

     method puedeMoverDerecha() {
            
            return self.position().x() < game.width() - 3

     }
    
     method moverDiagonalArribaDerecha() {
            
            position = position.up(1)

            position = position.right(1)
     }

     method moverDiagonalArribaIzquierda() {
            
            position = position.up(1)

            position = position.left(1)

     }

     method moverDiagonalAbajoDerecha() {
            
            position = position.down(1)

            position = position.right(1)
     }

     method moverDiagonalAbajoIzquierda() {
            
            position = position.down(1)

            position = position.left(1)

     }

     method moverArriba() {
            
            position = position.up(1)
     }

     method moverAbajo() {
            
            position = position.down(1)
     }

     method moverDerecha() {
            
            position = position.right(1)
     }

     method moverIzquierda() {
            
            position = position.left(1)
     } 
     
     method esUnaEsquina() {
            
            return self.esquinaSuperiorIzquierda() or self.esquinaSuperiorDerecha() or self.esquinaInferiorIzquierda() or self.esquinaInferiorDerecha()

     }

     method esquinaInferiorIzquierda() {

           return self.esBordeAbajo() and self.esBordeIzquierdo()

    }

    
    method esquinaInferiorDerecha() {
           
           return self.esBordeAbajo() and self.esBordeDerecha()

    }

    
    method esquinaSuperiorIzquierda() {
           
           return self.esBordeArriba() and self.esBordeIzquierdo()

    }

    
    method esquinaSuperiorDerecha() {
          
           return self.esBordeArriba() and self.esBordeDerecha()

    }

    method esUnBorde() {
           
           return self.esBordeArriba() or self.esBordeAbajo() or self.esBordeDerecha() or self.esBordeIzquierdo()

    }

    method esBordeArriba() {
           
           return position.y() >= game.height() - 2

    }


    method esBordeAbajo() {
           
           return position.y() <= 0

    }
    
    method esBordeDerecha() {
           
           return position.x() >= game.width() - 3

    }

  
     method esBordeIzquierdo() {
           
           return position.x() <= 0

     }
     
     method esMasGrandeCoyoteEnY() {

           return coyote.position().y() > self.position().y()

    }

    method esMasChicoCoyoteEnY() {

           return coyote.position().y() < self.position().y()

    }


    method esMasGrandeCoyoteEnX() {

           return coyote.position().x() > self.position().x()

    }

    method esMasChicoCoyoteEnX() {
           
           return coyote.position().x() < self.position().x()

    }

}

object correCaminosGanador {

       var property position = game.at(10,5)

       method image() {

              return "correCaminosInicial.png"


       }
       
       method play() {

              game.sound("mip.mp3").play()

       }

       method mensaje() {

              game.say(self,"Mip Mip")

       }

}

object correCaminosLose {

       const property position = game.at(10,3)

       method image() = "correCaminosLose.png" 

}
