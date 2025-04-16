import React from 'react';

// React creates a context object. This object holds the default value
// and two components: Provider and Consumer.
// Provider is used to provide the context to the children components.
// Consumer is used to consume the context.
const MealsContext = React.createContext();

const todaysMeals = ["Baked Beans", "Baked Sweet Potatoes", "Baked Potatoes"];

// The Provider (MealsProvider) component provides the context to the children components.
// The value prop is used to pass the context to the children components.
// This value is then made available to the children components using the useContext hook.
// The children components can access the context using the useContext hook.
// The useContext hook is used to consume the context.
const MealsProvider = ({ children }) => {

  const [meals, setMealsList] = React.useState(todaysMeals);

  return (
    <MealsContext.Provider value={{meals}}>
      {children}
    </MealsContext.Provider>
  );
}

export const useMealsListContext = () => React.useContext(MealsContext);

export default MealsProvider;