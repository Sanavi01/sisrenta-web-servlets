package com.jirehcompanyit.sisrenta.web.logica;

import com.jirehcompanyit.sisrenta.web.logica.Factura;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-08-10T17:42:05")
@StaticMetamodel(Employee.class)
public class Employee_ extends Person_ {

    public static volatile SingularAttribute<Employee, String> password;
    public static volatile ListAttribute<Employee, Factura> listaFacturas;
    public static volatile SingularAttribute<Employee, Integer> employee_id;
    public static volatile SingularAttribute<Employee, String> identificationNumber;
    public static volatile SingularAttribute<Employee, String> username;

}