package com.jirehcompanyit.sisrenta.web.logica;

import java.io.Serializable;
import java.time.LocalDateTime;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

@Entity
@SequenceGenerator(name = "invoice_seq",
        allocationSize = 1,
        initialValue = 1)
public class Factura implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,
            generator = "invoice_seq")
    private int id;

    private String description;

    /*
    Existen los siguientes estados
        -Apartado
        -Entregado
        -Recibido
     */
    private String state;

    private LocalDateTime creationDate;
    private LocalDateTime deliverDate;
    private LocalDateTime deliveredDate;
    private LocalDateTime devolutionDate;
    private LocalDateTime finishDate;

    private String extraInfoRent;
    private int rentValue;
    private int creditValue;
    private int depositValue;

    @ManyToOne
    @JoinColumn(name = "client_id") // crea la columna cliente_id en factura
    private Cliente cliente;
    
    @ManyToOne
    @JoinColumn(name = "employee_id")
    private Employee employee;


    public Factura() {
    }

    public Factura(int id, String description, String state, LocalDateTime creationDate, LocalDateTime deliverDate, LocalDateTime deliveredDate, LocalDateTime devolutionDate, LocalDateTime finishDate, String extraInfoRent, int rentValue, int creditValue, int depositValue, Cliente cliente, Employee employee) {
        this.id = id;
        this.description = description;
        this.state = state;
        this.creationDate = creationDate;
        this.deliverDate = deliverDate;
        this.deliveredDate = deliveredDate;
        this.devolutionDate = devolutionDate;
        this.finishDate = finishDate;
        this.extraInfoRent = extraInfoRent;
        this.rentValue = rentValue;
        this.creditValue = creditValue;
        this.depositValue = depositValue;
        this.cliente = cliente;
        this.employee = employee;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public LocalDateTime getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(LocalDateTime creationDate) {
        this.creationDate = creationDate;
    }

    public LocalDateTime getDevolutionDate() {
        return devolutionDate;
    }

    public void setDevolutionDate(LocalDateTime devolutionDate) {
        this.devolutionDate = devolutionDate;
    }

    public LocalDateTime getDeliverDate() {
        return deliverDate;
    }

    public void setDeliverDate(LocalDateTime deliverDate) {
        this.deliverDate = deliverDate;
    }

    public LocalDateTime getDeliveredDate() {
        return deliveredDate;
    }

    public void setDeliveredDate(LocalDateTime deliveredDate) {
        this.deliveredDate = deliveredDate;
    }

    public String getExtraInfoRent() {
        return extraInfoRent;
    }

    public void setExtraInfoRent(String extraInfoRent) {
        this.extraInfoRent = extraInfoRent;
    }

    public int getRentValue() {
        return rentValue;
    }

    public void setRentValue(int rentValue) {
        this.rentValue = rentValue;
    }

    public int getCreditValue() {
        return creditValue;
    }

    public void setCreditValue(int creditValue) {
        this.creditValue = creditValue;
    }

    public int getDepositValue() {
        return depositValue;
    }

    public void setDepositValue(int depositValue) {
        this.depositValue = depositValue;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public LocalDateTime getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(LocalDateTime finishDate) {
        this.finishDate = finishDate;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}
