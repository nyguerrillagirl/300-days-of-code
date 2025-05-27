import React, { useState } from 'react';
import withCounter from "./withCounter.js";

function HoverIncrease(props) {
  const [fontSize, setFontSize] = useState(10);

  return (
    <>
    <button onMouseOver={() => setFontSize(size => size + 1)}>
      Increase on hover
      </button>
      <p style={{ fontSize: `${fontSize}px` }}>
        Size of font in onMouseOver function: {fontSize}px
      </p>
      <div>
        Value of 'name' in HoverIncrease: {props.counter}
      </div>
   </>
  );
}


export default withCounter(HoverIncrease);
// We have now converted HoverIncrease to an HOC function. 
