import { useState } from "react";
import ChildComponent from "./ChildComponent";

function ParentComponent() {

    const [userData, setUserData] = useState({
        username: 'benny_dicta',
        email: 'benedictaonyebuchi@gmail.com',
      });
    
      return (
        <div>
          <h1>Welcome, {userData.username}!</h1>
          <ChildComponent dataFromParent={userData} />
        </div>
      );
};

export default ParentComponent;