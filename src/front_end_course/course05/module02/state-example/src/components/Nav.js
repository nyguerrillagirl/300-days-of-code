import { useState } from 'react';

function Nav( { handleAddItems }) {
    console.log("type of handleAddItems: ", typeof handleAddItems);

    // Locak state function
    const [name, setName] = useState("");

    // create a handler function that is triggered by Add button
    const handleAddButtonClick = () => {
        // creating a new Item object with name and id properties
        const newItem = {
            name,
            id: Date.now()
        };
        // Passing the newItem object into the handler function as an argument
        handleAddItems(newItem);

        // Reset the input field after adding the item
        setName("");
    }
    
    return (
        <>
            <input type="text" value={name} onChange={(e) => setName(e.target.value)}/>
            <button onClick={handleAddButtonClick}>Add</button>
        </>
    );
}

export default Nav;