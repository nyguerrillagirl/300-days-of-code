import React, { useState } from 'react';
import withCounter from "./withCounter.js";

function HoverIncrease() {
  const [fontSize, setFontSize] = useState(10);

  return (
    <div onMouseOver={() => setFontSize(size => size + 1)}>
      <p style={{ fontSize: `${fontSize}px` }}>
        Size of font: {fontSize}px
      </p>
    </div>
  );
}


export default withCounter(HoverIncrease);
// We have now converted HoverIncrease to an HOC function. 
