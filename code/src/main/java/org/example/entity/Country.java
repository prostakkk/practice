package org.example.entity;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name="country")
public class Country {


    @Id
    @Column(name = "idCountry")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;

    @Column(name="countryName")
    private String countryName;

    @OneToMany(mappedBy = "country")
    private List<Hotel> hotels;

    public Country() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public List<Hotel> getHotels() {
        return hotels;
    }

    public void setHotels(List<Hotel> hotels) {
        this.hotels = hotels;
    }
}
