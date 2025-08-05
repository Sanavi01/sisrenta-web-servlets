package com.jirehcompanyit.sisrenta.web.logica;

import com.jirehcompanyit.sisrenta.web.logica.Factura;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-08-05T12:39:23")
@StaticMetamodel(Cliente.class)
public class Cliente_ extends Person_ {

    public static volatile ListAttribute<Cliente, Factura> listaFacturas;
    public static volatile SingularAttribute<Cliente, Integer> client_id;

}