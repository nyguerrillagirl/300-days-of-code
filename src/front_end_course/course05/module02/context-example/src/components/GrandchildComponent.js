function GrandchildComponent({ dataFromChild }) {
    return (
        <div>
          <p>Username in Grandchild: {dataFromChild.username}</p>
        </div>
      );
}

export default GrandchildComponent;