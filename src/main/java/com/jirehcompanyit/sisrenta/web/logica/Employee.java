
package com.jirehcompanyit.sisrenta.web.logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

/**
 * Representa a un empleado en el sistema.
 * 
 * La clase hereda de {@link Person} e implementa {@link Serializable}.
 * Contiene la información específica de los empleados como credenciales de acceso,
 * número de identificación y la lista de facturas que gestiona.
 * 
 * Existe una relación de uno a muchos con la entidad {@link Factura}, lo que indica
 * que un empleado puede estar asociado a múltiples facturas. 
 * Si el empleado es eliminado, sus facturas también serán eliminadas.
 * 
 * @author Sanavi
 */

@Entity
@SequenceGenerator(
        name = "employee_seq",
        initialValue = 1,
        allocationSize = 1)
public class Employee extends Person implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,
            generator = "employee_seq")
    private int employee_id;
    
    @Basic
    private String username;
    private String password;
    private String identificationNumber;
    
    /**
     * Lista de facturas asociadas al empleado.
     * 
     * Relación uno a muchos con la entidad {@link Factura}. 
     * Indica todas las facturas gestionadas por este empleado.
     */

    @OneToMany (mappedBy = "employee", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Factura> listaFacturas;

    public Employee() {
    }

    public Employee(int employee_id, String username, String password, String identificationNumber, List<Factura> listaFacturas, String name, String lastName, String phoneNumber, String homeAddress) {
        super(name, lastName, phoneNumber, homeAddress);
        this.employee_id = employee_id;
        this.username = username;
        this.password = password;
        this.identificationNumber = identificationNumber;
        this.listaFacturas = listaFacturas;
    }

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIdentificationNumber() {
        return identificationNumber;
    }

    public void setIdentificationNumber(String identificationNumber) {
        this.identificationNumber = identificationNumber;
    }

    public List<Factura> getListaFacturas() {
        return listaFacturas;
    }

    public void setListaFacturas(List<Factura> listaFacturas) {
        this.listaFacturas = listaFacturas;
    }
}
