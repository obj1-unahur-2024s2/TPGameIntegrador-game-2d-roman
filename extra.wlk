import wollok.game.*

object ganador {

       const property position = game.at(12,12)
       
       method image() {

              return "youWin.png"

       }

}

object perdedor {
       
       const property position = game.at(12,12)

       method image() {
              
              return "youLose.png"

       }  

}