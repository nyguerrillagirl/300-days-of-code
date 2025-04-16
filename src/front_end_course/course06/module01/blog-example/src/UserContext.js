import { createContext, useContext, useState } from 'react';

// The function createContext returns two components:
// a Provider and a Consumer. The Provider component is used to wrap the
// components that need to access the context. The Consumer component is used
// to access the context values.
const UserContext = createContext();

// The UserProvider component is used to wrap the components that need to access
// the user context. It provides the user context values to the components that
// need them.
export const UserProvider = ({children}) => {
    const [user] = useState({
        name: 'John Doe',
        email: "john@example.com",
        dob: "01/01/2000",
    });

    return (<UserContext.Provider value={{ user }}>{children}</UserContext.Provider>);
}

export const useUser = () => useContext(UserContext);