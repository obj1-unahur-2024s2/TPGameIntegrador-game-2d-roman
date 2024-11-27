import wollok.game.*
object musicaFondo {
       
       method iniciar() {
              
              const music = game.sound("fondoMusica.mp3")
              music.shouldLoop(true)
              game.schedule(250,{music.play()} )
              keyboard.up().onPressDo({music.volume(1)})
              keyboard.p().onPressDo({music.pause()})
              keyboard.r().onPressDo({music.resume()})

       }

}