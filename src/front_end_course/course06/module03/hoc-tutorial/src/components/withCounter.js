import React, { useState } from 'react';

const withCounter = (OriginalComponent) => {

    function NewComponent(props) {
        const [counter, setCounter] = useState(20
            
        );

        return (
            <OriginalComponent
                counter={counter}
                incrementCounter={() => setCounter(counter + 1)}
                {...props}
            />
        )
    }
    return NewComponent;
};

export default withCounter