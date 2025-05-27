import React, { useState } from 'react';
import withCounter from "./withCounter.js";

function ClickIncrease(props) {
    const [fontSize, setFontSize] = useState(10);

    return (
        <>
        <button onClick={()=> setFontSize(size => size + 1)}>
            Increase with click
        </button>
        <p style={{ fontSize: `${fontSize}px`}}>
            Size of font in OnClick function: {fontSize}px
        </p>
        <div>
            Value of 'name' in ClickIncrease: {props.counter}
        </div>
        </>
    );
    
}

export default withCounter(ClickIncrease);
