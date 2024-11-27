import wollok.game.*
import personajes.*
import correcaminos.*
import extra.*
import sonido.*
import vidaPersonajes.*
import ovejas.*


object nivelFacil {
       
       method iniciar() {
              
               config.configurarTeclas()
               musicaFondo.iniciar()
               game.addVisual(coyote)
               coyote.mostrarMensaje(5000)
               agregarCorazones.nivel()
               game.addVisual(cazador)
               game.addVisual(granja)
               agregarOvejas.prepararRebanioNivel1()
               cazador.empezarAPerseguir(450)
               controlDeColisiones.config()
               controlDeColisiones2.config()     
               correcaminos.play()
               game.addVisual(correcaminos)
               correcaminos.empezarAMover(450)
               game.start()

       }

}


object nivelMedio {
       
       method iniciar() {
              
               config.configurarTeclas()
               musicaFondo.iniciar()
               game.addVisual(coyote)
               coyote.mostrarMensaje(5000)
               agregarCorazones.nivel()
               game.addVisual(cazador)
               game.addVisual(granja)
               agregarOvejas.prepararRebanioNivel2()
               cazador.empezarAPerseguir(350)
               controlDeColisiones.config()
               controlDeColisiones2.config()     
               correcaminos.play()
               game.addVisual(correcaminos)
               correcaminos.empezarAMover(350)
               game.start()

       }

}


object nivelDificil {
       
       method iniciar() {
              
               config.configurarTeclas()
               musicaFondo.iniciar()
               game.addVisual(coyote)
               coyote.mostrarMensaje(5000)
               agregarCorazones.nivel()
               game.addVisual(cazador)
               game.addVisual(granja)
               agregarOvejas.prepararRebanioNivel2()
               cazador.empezarAPerseguir(200)
               controlDeColisiones.config()
               controlDeColisiones2.config()     
               correcaminos.play()
               game.addVisual(correcaminos)
               correcaminos.empezarAMover(200)
               game.start()

       }

}


object agregarCorazones {
       
       method nivel() {

              game.addVisual(corazonRojo)

              game.addVisual(corazonRojo2)

              game.addVisual(corazonRojo3)

              game.addVisual(corazonRojo4)

              game.addVisual(corazonRojo5)

              game.addVisual(corazonRojo6)

              game.addVisual(corazonRojo7)

       }

}


object agregarOvejas {

method prepararRebanioNivel1() {

    game.addVisual(ovejaRebotadora1)
    game.addVisual(ovejaRebotadora2)
    game.addVisual(ovejaRebotadora3)
    game.addVisual(ovejaDiagonal1)
    game.addVisual(ovejaDiagonal2)
    game.addVisual(ovejaDiagonal3)

    controlDeColisiones3.config(ovejaRebotadora1)
    controlDeColisiones3.config(ovejaRebotadora2)
    controlDeColisiones3.config(ovejaRebotadora3)
    controlDeColisiones3.config(ovejaDiagonal1)
    controlDeColisiones3.config(ovejaDiagonal2)
    controlDeColisiones3.config(ovejaDiagonal3)

    ovejaRebotadora1.accion(200)
    ovejaRebotadora2.accion(200)
    ovejaRebotadora3.accion(200)
    ovejaDiagonal1.accion(200)
    ovejaDiagonal2.accion(200)
    ovejaDiagonal3.accion(200)
}


method prepararRebanioNivel2() {
   
    game.addVisual(ovejaRebotadora4)
    game.addVisual(ovejaRebotadora5)
    game.addVisual(ovejaDiagonal4)
    game.addVisual(ovejaDiagonal5)

    controlDeColisiones3.config(ovejaRebotadora4)
    controlDeColisiones3.config(ovejaRebotadora5)
    controlDeColisiones3.config(ovejaDiagonal4)
    controlDeColisiones3.config(ovejaDiagonal5)

    ovejaRebotadora4.accion(200)
    ovejaRebotadora5.accion(200)
    ovejaDiagonal4.accion(300)
    ovejaDiagonal5.accion(300)

    
    game.addVisual(ovejaRebotadoraEnvenenada1)
    game.addVisual(ovejaRebotadoraEnvenenada2)
    game.addVisual(ovejaDiagonalEnvenenada1)
    game.addVisual(ovejaDiagonalEnvenenada2)

    controlDeColisiones3.config(ovejaRebotadoraEnvenenada1)
    controlDeColisiones3.config(ovejaRebotadoraEnvenenada2)
    controlDeColisiones3.config(ovejaDiagonalEnvenenada1)
    controlDeColisiones3.config(ovejaDiagonalEnvenenada2)

    ovejaRebotadoraEnvenenada1.accion(400)
    ovejaRebotadoraEnvenenada2.accion(400)
    ovejaDiagonalEnvenenada1.accion(400)
    ovejaDiagonalEnvenenada2.accion(400)
}


method prepararRebanioNivel3() {

    game.addVisual(ovejaRebotadora6)
    game.addVisual(ovejaDiagonal6)

    controlDeColisiones3.config(ovejaRebotadora6)
    controlDeColisiones3.config(ovejaDiagonal6)

    ovejaRebotadora6.accion(500)
    ovejaDiagonal6.accion(500)

    game.addVisual(ovejaRebotadoraEnvenenada3)
    game.addVisual(ovejaRebotadoraEnvenenada4)
    game.addVisual(ovejaRebotadoraEnvenenada5)
    game.addVisual(ovejaDiagonalEnvenenada3)
    game.addVisual(ovejaDiagonalEnvenenada4)
    game.addVisual(ovejaDiagonalEnvenenada5)

    controlDeColisiones3.config(ovejaRebotadoraEnvenenada3)
    controlDeColisiones3.config(ovejaRebotadoraEnvenenada4)
    controlDeColisiones3.config(ovejaRebotadoraEnvenenada5)
    controlDeColisiones3.config(ovejaDiagonalEnvenenada3)
    controlDeColisiones3.config(ovejaDiagonalEnvenenada4)
    controlDeColisiones3.config(ovejaDiagonalEnvenenada5)

    ovejaRebotadoraEnvenenada3.accion(600)
    ovejaRebotadoraEnvenenada4.accion(600)
    ovejaRebotadoraEnvenenada5.accion(600)
    ovejaDiagonalEnvenenada3.accion(600)
    ovejaDiagonalEnvenenada4.accion(600)
    ovejaDiagonalEnvenenada5.accion(600)
}   

    method quitarTodasLasOvejas() {
           
           game.removeVisual(ovejaRebotadora1)
           game.removeVisual(ovejaRebotadora2)
           game.removeVisual(ovejaRebotadora3)
           game.removeVisual(ovejaRebotadora4)
           game.removeVisual(ovejaRebotadora5)
           game.removeVisual(ovejaRebotadora6)
           game.removeVisual(ovejaRebotadora7)
           game.removeVisual(ovejaRebotadora8)
           game.removeVisual(ovejaRebotadora9)
           game.removeVisual(ovejaRebotadora10)
           game.removeVisual(ovejaRebotadora11)
           game.removeVisual(ovejaRebotadora12)

           game.removeVisual(ovejaDiagonal1)
           game.removeVisual(ovejaDiagonal2)
           game.removeVisual(ovejaDiagonal3)
           game.removeVisual(ovejaDiagonal4)
           game.removeVisual(ovejaDiagonal5)
           game.removeVisual(ovejaDiagonal6)
           game.removeVisual(ovejaDiagonal7)
           game.removeVisual(ovejaDiagonal8)
           game.removeVisual(ovejaDiagonal9)
           game.removeVisual(ovejaDiagonal10)
           game.removeVisual(ovejaDiagonal11)
           game.removeVisual(ovejaDiagonal12)

           game.removeVisual(ovejaRebotadoraEnvenenada1)
           game.removeVisual(ovejaRebotadoraEnvenenada2)
           game.removeVisual(ovejaRebotadoraEnvenenada3)
           game.removeVisual(ovejaRebotadoraEnvenenada4)
           game.removeVisual(ovejaRebotadoraEnvenenada5)
           game.removeVisual(ovejaRebotadoraEnvenenada6)
           game.removeVisual(ovejaRebotadoraEnvenenada7)
           game.removeVisual(ovejaRebotadoraEnvenenada8)
           game.removeVisual(ovejaRebotadoraEnvenenada9)
           game.removeVisual(ovejaRebotadoraEnvenenada10)
           game.removeVisual(ovejaRebotadoraEnvenenada11)
           game.removeVisual(ovejaRebotadoraEnvenenada12)

           game.removeVisual(ovejaDiagonalEnvenenada1)
           game.removeVisual(ovejaDiagonalEnvenenada2)
           game.removeVisual(ovejaDiagonalEnvenenada3)
           game.removeVisual(ovejaDiagonalEnvenenada4)
           game.removeVisual(ovejaDiagonalEnvenenada5)
           game.removeVisual(ovejaDiagonalEnvenenada6)
           game.removeVisual(ovejaDiagonalEnvenenada7)
           game.removeVisual(ovejaDiagonalEnvenenada8)
           game.removeVisual(ovejaDiagonalEnvenenada9)
           game.removeVisual(ovejaDiagonalEnvenenada10)
           game.removeVisual(ovejaDiagonalEnvenenada11)
           game.removeVisual(ovejaDiagonalEnvenenada12)

    }


}

