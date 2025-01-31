import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import '../styles/EventList.css';

const EventList = () => {
  const [events, setEvents] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Simulated API call - replace with your actual API
    fetchEvents();
  }, []);

  const fetchEvents = async () => {
    try {
      // Replace with actual API call
      const mockEvents = [
        {
          id: 1,
          name: "Summer Music Festival",
          date: "2024-07-15",
          location: "Central Park",
          image: "festival-image.jpg"
        },
        {
          id: 2,
          name: "Tech Conference 2024",
          date: "2024-08-20",
          location: "Convention Center",
          image: "conference-image.jpg"
        }
        // Add more events as needed
      ];
      
      setEvents(mockEvents);
      setLoading(false);
    } catch (error) {
      console.error("Error fetching events:", error);
      setLoading(false);
    }
  };

  if (loading) {
    return <div className="loading">Loading events...</div>;
  }

  return (
    <div className="events-container">
      <h1>Upcoming Events</h1>
      <div className="events-grid">
        {events.map(event => (
          <Link to={`/event/${event.id}`} key={event.id} className="event-card">
            <img src={event.image} alt={event.name} />
            <div className="event-info">
              <h2>{event.name}</h2>
              <p>{new Date(event.date).toLocaleDateString()}</p>
              <p>{event.location}</p>
            </div>
          </Link>
        ))}
      </div>
    </div>
  );
};

export default EventList; 