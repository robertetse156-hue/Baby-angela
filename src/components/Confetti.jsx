import React, { useEffect } from 'react';
import './Confetti.css';

const Confetti = () => {
  useEffect(() => {
    const confettiContainer = document.querySelector('.confetti-container');
    
    for (let i = 0; i < 100; i++) {
      const confetti = document.createElement('div');
      confetti.className = 'confetti-piece';
      confetti.style.left = Math.random() * 100 + '%';
      confetti.style.delay = Math.random() * 0.5 + 's';
      confetti.style.duration = Math.random() * 2 + 2 + 's';
      confetti.style.backgroundColor = getRandomColor();
      confettiContainer.appendChild(confetti);
    }
  }, []);

  const getRandomColor = () => {
    const colors = ['#FF6B9D', '#FEC8D8', '#FDBCB4', '#FF9671', '#FFB88C', '#A8E6CF', '#FFD3B6', '#FFAAA5'];
    return colors[Math.floor(Math.random() * colors.length)];
  };

  return <div className="confetti-container"></div>;
};

export default Confetti;