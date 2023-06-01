package org.example.entity;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name="room")
public class Room {

    @Id
    @Column(name = "idRoom")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="idHotel")
    private Hotel hotel;

    @Column(name="capacity")
    private int capacity;

    @OneToMany(mappedBy="room")
    private List<Booking> bookings;

    public Room() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public List<Booking> getBookings() {
        return bookings;
    }

    public void setBookings(List<Booking> bookings) {
        this.bookings = bookings;
    }
}
