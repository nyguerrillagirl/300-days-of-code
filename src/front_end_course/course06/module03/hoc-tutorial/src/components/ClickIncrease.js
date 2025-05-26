import React, { useState } from 'react';
import withCounter from "./withCounter.js";

function ClickIncrease() {
    const [fontSize, setFontSize] = useState(10);

    return (
        <>
        <button onClick={()=> setFontSize(size => size + 1)}>
            Increase with click
        </button>
        <p style={{ fontSize: `${fontSize}px`}}>
            Size of font: {fontSize}px
        </p>
        </>
    );
    
}

export default withCounter(ClickIncrease);