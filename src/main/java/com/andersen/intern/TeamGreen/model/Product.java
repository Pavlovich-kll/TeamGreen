package com.andersen.intern.TeamGreen.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.Date;
import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "products")
public class Product extends AbstractBaseEntity{
    @Id
    @GeneratedValue(strategy = IDENTITY)
    private long id;
    private String description;
    private long price;
    @Lob
    private byte image;
    private Date created;
    private Date lastUpdated;
    @ManyToOne
    @JoinColumn(name = "type_id")
    private Type type;
    @ManyToMany(mappedBy = "products")
    Set<Order> orders;
}
