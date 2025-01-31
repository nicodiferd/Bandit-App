import React from 'react';
import { Link } from 'react-router-dom';
import '../styles/Home.css';

const Home = () => {
  return (
    <div className="home-container">
      <header className="hero-section">
        <h1>Welcome to Bandit</h1>
        <p>Your Event Transportation Solution</p>
        <Link to="/events" className="cta-button">
          Find Your Event
        </Link>
      </header>
      
      <section className="features-section">
        <h2>Why Choose Bandit?</h2>
        <div className="features-grid">
          <div className="feature-card">
            <h3>Event-Specific Rides</h3>
            <p>Dedicated transportation for your special events</p>
          </div>
          <div className="feature-card">
            <h3>Reliable Service</h3>
            <p>Professional drivers and timely pickups</p>
          </div>
          <div className="feature-card">
            <h3>Group Booking</h3>
            <p>Easy coordination for group transportation</p>
          </div>
        </div>
      </section>
    </div>
  );
};

export default Home; 