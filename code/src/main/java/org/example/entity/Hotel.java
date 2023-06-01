package org.example.entity;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name="hotel")
public class Hotel {

    @Id
    @Column(name = "idHotel")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="hotelName")
    private String hotelName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idCountry")
    private Country country;

    @OneToMany(mappedBy ="hotel")
    private List<Room> rooms;

    public Hotel() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public List<Room> getRooms() {
        return rooms;
    }

    public void setRooms(List<Room> rooms) {
        this.rooms = rooms;
    }
}
