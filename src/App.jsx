import React from 'react';

const App = () => {
    const [musicPlaying, setMusicPlaying] = React.useState(false);

    const toggleMusic = () => {
        setMusicPlaying(!musicPlaying);
    };

    return (
        <div>
            <h1>Happy Birthday Angela!</h1>
            <div>
                <button onClick={toggleMusic}>{musicPlaying ? 'Pause Music' : 'Play Music'}</button>
                <audio src="/path/to/music.mp3" autoPlay={musicPlaying} loop />
            </div>
            <canvas id="canvas" width="400" height="400"></canvas>
            <div className="confetti-container">
                {/* Confetti animation goes here */}
            </div>
            <div className="birthday-card">
                <h2>Happy Birthday!</h2>
                <p>Wishing you a day filled with love, joy, and all your favorite things!</p>
            </div>
        </div>
    );
};

export default App;