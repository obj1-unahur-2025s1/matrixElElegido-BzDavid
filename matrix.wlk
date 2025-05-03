object neo {
    var energia = 100

    method esElElegido() = true

    method vitalidad() = energia * 0.1

    method saltar() {
        energia = energia - (energia / 2)
    }
}

object morfeo {
    var estaCansado = false

    var vitalidad = 8

    method vitalidad() = vitalidad

    method esElElegido() = false

    method saltar() {
        estaCansado = not estaCansado
        vitalidad = 0.max(vitalidad - 1)
    }
}

object trinity {
    method esElElegido() = false

    method vitalidad() = 0

    method saltar() {}
}

object nave {
    const pasajeros = [neo, morfeo, trinity]

    method agregarPasajero(nuevoPasajero) {
        pasajeros.add(nuevoPasajero)
    }

    method eliminarPasajero(pasajero) {
        pasajeros.remove(pasajero)
    }

    method pasajeros() = pasajeros

    method cuantosPasajerosHay() = pasajeros.size()

    method cualEsElPasajeroDeMayorVitalidad() = pasajeros.max({pasajero => pasajero.vitalidad()})

    method estaElElegido() = pasajeros.any({pasajero => pasajero.esElElegido()})

    method estaEquilibrada() = pasajeros.all({pasajero => pasajero.vitalidad() * 2 >= self.cualEsElPasajeroDeMayorVitalidad().vitalidad()})

    method vitalidadDeLosPasajeros() = pasajeros.map({pasajero => pasajero.vitalidad()})

    method choca() {
        pasajeros.forEach({pasajero => pasajero.saltar()})
        pasajeros.clear()
    }

    method acelera() {
        pasajeros.forEach(
            {pasajero => 
                if(not pasajero.esElElegido()) {
                    pasajero.saltar()
                }
                else {
                    pasajeros.remove(pasajero)
                }
            }
        )
    }
}