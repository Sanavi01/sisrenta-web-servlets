
package com.jirehcompanyit.sisrenta.web.logica;

import javax.persistence.MappedSuperclass;

/**
 * Clase abstracta que permite dar los datos basicos para las clases de Cliente, employee
 * 
 * @author Sanavi
 */

@MappedSuperclass
public abstract class Person {
        
    private String name;
    private String lastName;
    private String phoneNumber;
    private String homeAddress;

    public Person() {
    }

    public Person(String name, String lastName, String phoneNumber, String homeAddress) {
        this.name = name;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.homeAddress = homeAddress;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getHomeAddress() {
        return homeAddress;
    }

    public void setHomeAddress(String homeAddress) {
        this.homeAddress = homeAddress;
    }
    
    
}
