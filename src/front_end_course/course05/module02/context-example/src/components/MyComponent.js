import { createContext, useContext } from 'react';

const MyContext = createContext();

const MyComponent = () => {
    const sharedValue = useContext(MyContext);
    return <p>{sharedValue}</p>;
}
export default MyComponent;