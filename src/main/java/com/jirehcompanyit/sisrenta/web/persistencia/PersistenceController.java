package com.jirehcompanyit.sisrenta.web.persistencia;

import com.jirehcompanyit.sisrenta.web.logica.Cliente;
import com.jirehcompanyit.sisrenta.web.logica.Employee;
import com.jirehcompanyit.sisrenta.web.logica.Factura;
import com.mycompany.sisrenta_backend.persistence.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sanavi
 */
public class PersistenceController {

    // --------------------ClienteJpaController--------------------------
    ClienteJpaController clienteJpa = new ClienteJpaController();

    public void createCliente(Cliente cliente) {
        clienteJpa.create(cliente);
    }

    public Cliente findClienteByPhoneNumber(String phoneNumber) {
        return clienteJpa.findClienteByPhoneNumber(phoneNumber);
    }

    public void editCliente(Cliente clienteEncontrado) {
        try {
            clienteJpa.edit(clienteEncontrado);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteCliente(int client_id) {
        try {
            clienteJpa.destroy(client_id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // --------------------Employee Jpa Controller --------------------------
    EmployeeJpaController employeeJpa = new EmployeeJpaController();

    public void createEmployee(Employee employee) {
        employeeJpa.create(employee);
    }

    public Employee findEmployeeByPhoneNumber(String phoneNumber) {
        return employeeJpa.findEmployeeByPhoneNumber(phoneNumber);
    }

    public void editEmployee(Employee employeeFound) {
        try {
            employeeJpa.edit(employeeFound);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deteteEmployee(int employee_id) {
        try {
            employeeJpa.destroy(employee_id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // --------------------Factura Jpa Controller --------------------------
    FacturaJpaController facturaJpa = new FacturaJpaController();

    public void createFactura(Factura factura) {
        facturaJpa.create(factura);
    }

    public Factura findFacturaById(int id) {
        return facturaJpa.findFactura(id);
    }

    public void editFactura(Factura facturaEncontrada) {
        try {
            facturaJpa.edit(facturaEncontrada);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteFactura(int id) {
        try {
            facturaJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //----------------------Sistema de Alertas--------------------------------------
    public List<Factura> findAllFacturasPorEntregar() {
        return facturaJpa.findAllFacturasPorEntregar();
    }

    public List<Factura> findAllFacturasPorRecibir() {
        return facturaJpa.findAllFacturasPorRecibir();
    }
}
