package com.jirehcompanyit.sisrenta.web.logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

/**
 * Representa un cliente en el sistema. Esta clase hereda de {@link Person} y
 * contiene la información específica de un cliente, incluyendo sus facturas
 * asociadas.
 *
 * <p>
 * Un cliente puede tener múltiples facturas asociadas mediante una relación de
 * uno a muchos (OneToMany). Además, la clase implementa {@link Serializable}
 * para permitir su persistencia y transmisión.</p>
 *
 * @author Santiago Angarita
 */
@Entity
@SequenceGenerator(
        name = "cliente_seq",
        initialValue = 1,
        allocationSize = 1
)
public class Cliente extends Person implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,
            generator = "cliente_seq")
    private int client_id;

    /**
     * Lista de facturas asociadas al cliente.
     *
     * 
     * Relación uno a muchos con la entidad {@link Factura}. El cliente puede
     * tener múltiples facturas, y si se elimina el cliente, sus facturas
     * también serán eliminadas automáticamente.
     */
    
    @OneToMany(mappedBy = "cliente", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Factura> listaFacturas;

    public Cliente() {
    }

    public Cliente(int client_id, List<Factura> listaFacturas, String name, String lastName, String phoneNumber, String homeAddress) {
        super(name, lastName, phoneNumber, homeAddress);
        this.client_id = client_id;
        this.listaFacturas = listaFacturas;
    }

    public int getClient_id() {
        return client_id;
    }

    public void setClient_id(int client_id) {
        this.client_id = client_id;
    }

    public List<Factura> getListaFacturas() {
        return listaFacturas;
    }

    public void setListaFacturas(List<Factura> listaFacturas) {
        this.listaFacturas = listaFacturas;
    }

}
