import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import '../styles/EventDetail.css';

const EventDetail = () => {
  const { id } = useParams();
  const [event, setEvent] = useState(null);
  const [loading, setLoading] = useState(true);
  const [selectedRide, setSelectedRide] = useState(null);

  useEffect(() => {
    fetchEventDetails();
  }, [id]);

  const fetchEventDetails = async () => {
    try {
      // Replace with actual API call
      const mockEvent = {
        id: id,
        name: "Summer Music Festival",
        date: "2024-07-15",
        location: "Central Park",
        description: "Join us for the biggest music festival of the year!",
        rides: [
          {
            id: 1,
            type: "Standard",
            price: 25,
            capacity: 4
          },
          {
            id: 2,
            type: "Premium",
            price: 40,
            capacity: 6
          }
        ]
      };

      setEvent(mockEvent);
      setLoading(false);
    } catch (error) {
      console.error("Error fetching event details:", error);
      setLoading(false);
    }
  };

  const handleRideSelection = (ride) => {
    setSelectedRide(ride);
  };

  const handleBooking = () => {
    if (!selectedRide) return;
    // Implement booking logic here
    alert(`Booking confirmed for ${selectedRide.type} ride!`);
  };

  if (loading) {
    return <div className="loading">Loading event details...</div>;
  }

  if (!event) {
    return <div className="error">Event not found</div>;
  }

  return (
    <div className="event-detail-container">
      <div className="event-info-section">
        <h1>{event.name}</h1>
        <p className="event-date">{new Date(event.date).toLocaleDateString()}</p>
        <p className="event-location">{event.location}</p>
        <p className="event-description">{event.description}</p>
      </div>

      <div className="rides-section">
        <h2>Available Rides</h2>
        <div className="rides-grid">
          {event.rides.map(ride => (
            <div 
              key={ride.id} 
              className={`ride-card ${selectedRide?.id === ride.id ? 'selected' : ''}`}
              onClick={() => handleRideSelection(ride)}
            >
              <h3>{ride.type}</h3>
              <p>Price: ${ride.price}</p>
              <p>Capacity: {ride.capacity} passengers</p>
            </div>
          ))}
        </div>

        <button 
          className="booking-button"
          disabled={!selectedRide}
          onClick={handleBooking}
        >
          Book Ride
        </button>
      </div>
    </div>
  );
};

export default EventDetail; 