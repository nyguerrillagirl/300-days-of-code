import React from 'react';

const EnhancedContainer = ({ children }) => {
  const enhancedChildren = React.Children.map(children, child => 
    React.cloneElement(child, { className: 'enhanced' })
  );

  return <div className="container">{enhancedChildren}</div>;
};


function App() {
  return (
    <EnhancedContainer>
      <h1>Enhanced Heading</h1>
      <p>This paragraph is enhanced</p>
    </EnhancedContainer>
  );
}

export default App;
