class Equipo{
    method nombre()=nombre
    method nivelDeEnergiaBase()=energiaBase
    method entrenador()=entrenador
    method tecnoligias()=tecnologias

    const nombre
    var energiaBase
    method cambiarEnergia(nuevaCantidad){energiaBase=nuevaCantidad}
    const tecnologias
    method agregarTecnologia(nuevaTecnologia){tecnologias.add(nuevaTecnologia)}
    var entrenador 
    method cambiarEntrenador(nuevo){entrenador=nuevo}
    method energiaTotal()=energiaBase + tecnologias.filter({tecnologia=>tecnologia.estaActivo()}).sum({tecnologia=>tecnologia.valorEnergetico()})
}

class Tecnologia{
    method nombre()=nombre
    method valorEnergetico()=energia
    method estaActivo()=estaActivo
    const nombre
    var energia
    var estaActivo=true
    method activar(){estaActivo=true}
    method desactivar(){estaActivo=false}
    method cambiarEnergia(nuevaCantidad){energia=nuevaCantidad}
}

class Luminico inherits Equipo(){
    method nivelDeRadiacion()= radiacion
    method cristalesSolares() = cristalesSolares
    const cristalesSolares//strings
    method agregarCristal(nuevoCristal){cristalesSolares.add(nuevoCristal)}
    var radiacion
    method cambiarNivelDeRadiacion(nuevaCantidad){radiacion=nuevaCantidad}   
    override method energiaTotal()= if(radiacion <=5000)super()+0.1*super() else super()
}
class Sintetico inherits Equipo(){
    method nivelDeProcesamientoCental()= teraflops
    method cantidadDeModulosActivos()=modulos
    method estaCertificado()= estaCertificado
    var teraflops 
    var modulos
    var estaCertificado= true
    method descertificar(){estaCertificado=false}
    method certificar(){estaCertificado=true}
    method cambiarTeraflops(nuevaCantidad){teraflops=nuevaCantidad}
    method cambiarModulos(nuevaCantidad){modulos=nuevaCantidad}
    override method energiaTotal()=if(modulos>5)super()- 0.2*super() else super()
}
class Eterico inherits Equipo(){
    method nivelDeFluctuacion()= fluctuacion
    method cantidadDePortaltes()=portales
    var fluctuacion 
    var portales
    method cambiarFluctuacion(nuevaCantidad){fluctuacion=nuevaCantidad}
    method cambiarPortales(nuevaCantidad){portales=nuevaCantidad}

}

class Entrenador{
    var ciclosSolaresDeExperiencia
    var estaEnSintonia =true
    var nivelDePresicion
    var rol
    method cambiarCiclosSolares(nuevaCantidad){ciclosSolaresDeExperiencia=nuevaCantidad}
    method cambiarPresicion(nuevaCantidad){nivelDePresicion=nuevaCantidad}
    method cambiarRol(nuevo){rol=nuevo}
    method sintonisar(){estaEnSintonia=true}
    method desintonisar(){estaEnSintonia=false}
    method initialize(){
        if(![estrategaCuantico,arquitectoDeEnergia,guiaMental].contains(rol)){
            self.error("Rol no homologado por la FOZ")
        }
        nivelDePresicion=nivelDePresicion.limitBetween(0, 100)
    }
    method esEliteGalactica()= ciclosSolaresDeExperiencia >10 && rol.esElite(self)
    method presicion()=nivelDePresicion
    method estaEnSintonia()=estaEnSintonia
}

object estrategaCuantico{method esElite(entrenador)= entrenador.presicion()>80}
object arquitectoDeEnergia{method esElite(entrenador)= entrenador.estaEnSintonia()}
object guiaMental{method esElite(entrenador)= true}