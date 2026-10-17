class Equipo{
    const nombre
    method nombre()=nombre
    var entrenador 
    method nivelDeEnergiaBase()=energiaBase
    const energiaBase
    method entrenador()=entrenador
    method cambiarEntrenador(nuevoEntrenador){entrenador=nuevoEntrenador}
    const tecnologias //lista
    method agregarNuevaTecnologia(tecnologia) {tecnologias.add(tecnologia)}
    method energiaTotal()= energiaBase + tecnologias.filter({unaTecnologia=> unaTecnologia.activa()}).sum({unaTecnologia=>unaTecnologia.valorEnergetico()})

}
class Luminico inherits Equipo(){
    const radiacion //numero
    method nivelDeRadiacion() = radiacion
    method cristalesSolares()=cristalesSolares
    const cristalesSolares  //strings
    method agregarNuevoCristal(nuevoCristal){cristalesSolares.add(nuevoCristal)}
    override method energiaTotal()= if(self.nivelDeRadiacion() <=5000) super()+0.1*super() else energiaBase

}
class Sintetico inherits Equipo(){
    
    method nivelDeProcesamientoCentral() = teraflops
    var teraflops
    method cambiarTeraflopsA(nuevaCantidad) {teraflops=nuevaCantidad}
    
    method cantidadDeModulosActivos()= modulos
    var modulos 
    method cambiarCantidadDeModulos(nuevaCantidad) {modulos=nuevaCantidad}
    
    var estaCertificado = true
    method estaCertificado() = estaCertificado
    method desertificar(){estaCertificado=false}
    method certificar(){estaCertificado=true}
    override method energiaTotal()= if(modulos > 5) super()- 0.2*super() else super()
}

class Eterico inherits Equipo(){
    var fluctuacion
    method cambiarFluctuacion(nuevaCantidad) {fluctuacion=nuevaCantidad}
    method nivelDeFluctuacion() = fluctuacion
 
    method cantidadDePortalesAbiertos() = portalesAbiertos
    var portalesAbiertos
    method cambiarCantidadDePortalesAbiertos(cantidadNueva) {portalesAbiertos=cantidadNueva}

}

class Entrenador {
    var cantidadDeCiclos
    method cambiarCicloA(nuevaCantidad){cantidadDeCiclos=nuevaCantidad}
    method estaEnSontoniaConSuEquipo()= estaEnSintonia
    var estaEnSintonia = true
    method sintonisar(){estaEnSintonia=true}
    method desintonisar(){estaEnSintonia=false}
    var nivelDePrecision 
    
    const rol
    method rol()=rol
    method initialize() {
      if(![estrategaCuantico,arquitectoDeEnergia,guiaMental].contains(rol)){
        self.error("Rol no homologado por la FOZ")
      }
      nivelDePrecision=nivelDePrecision.limitBetween(0, 100)

    }
}

object estrategaCuantico {}
object arquitectoDeEnergia{}
object guiaMental{}
class Tecnologia{
    method nombre() = nombre
    method valorEnergetico()=valorEnergetico
    method activa()=estaActivo
    var estaActivo = true
    method desactivar(){estaActivo=false}
    method activar(){estaActivo=true}
    const nombre
    var valorEnergetico
    method cambiarEnergia(nuevaCantidad){valorEnergetico=nuevaCantidad}

}

